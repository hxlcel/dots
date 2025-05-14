{
  config,
  lib,
  pkgs,
  ...
}: {
  # Enable the uinput module
  boot.kernelModules = ["uinput"];

  # Enable uinput
  hardware.uinput.enable = true;

  # Set up udev rules for uinput
  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';

  # Ensure the uinput group exists
  users.groups.uinput = {};

  # Add the Kanata service user to necessary groups
  systemd.services.kanata-internalKeyboard.serviceConfig = {
    SupplementaryGroups = [
      "input"
      "uinput"
    ];
  };

  # TODO: not working for surface keyboard...
  # TODO: mouse speed and buttons
  # NOTES: homerow mods add a little delay feels really uncomfortable, typos

  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        # Replace the paths below with the appropriate device paths for your setup.
        # Use `ls /dev/input/by-path/` to find your keyboard devices.
        devices = [];
        port = 12345;
        extraDefCfg = "process-unmapped-keys yes";
        config = ''
          ;; to allow kanata to process unmapped keys
          (defsrc
            esc    f1  f2  f3  f4   f5  f6  f7  f8   f9  f10  f11  f12    f13
            grv   1    2    3    4    5   6 =   7    8    9    0    -    bspc      ins home pgup
            tab   q    w    e    r    t    [    y    u    i    o    p   '  \       del end  pgdn
            caps  a    s    d    f    g    ]    h    j    k    l    ;     ret
            lsft       x    c    v   b z   /    n    m    ,    .         rsft          up
            lctl   lmet   lalt            spc           ralt    menu     rctl    lft  down  rght
          )

          (defvar
            tt 150
            ht 200
          )

          (defalias
          ;; most common homerow mod order: super, alt, shift, control
          ;;  a (multi f24 (tap-hold $tt $ht a lmet))
          ;;  s (multi f24 (tap-hold $tt $ht s lalt))
          ;;  d (multi f24 (tap-hold $tt $ht d lsft))
          ;;  f (multi f24 (tap-hold $tt $ht f lctl))
          ;;  j (multi f24 (tap-hold $tt $ht j rctl))
          ;;  k (multi f24 (tap-hold $tt $ht k rsft))
          ;;  l (multi f24 (tap-hold $tt $ht l ralt))
          ;;  ; (multi f24 (tap-hold $tt $ht ; rmet))
            mo_scnd (layer-while-held secondary)
            spc (multi f24 (tap-hold $tt $ht spc @mo_scnd))
            cmk (layer-switch colemakDH)
            qwt (layer-switch base-qwerty)

            msl (layer-while-held mouse)
            ms< (movemouse-left 4 4)
            ms> (movemouse-right 4 4)
            msu (movemouse-up 4 4)
            msd (movemouse-down 4 4)
            fst (movemouse-speed 200)
            slw (movemouse-speed 50)
            vsl (movemouse-speed 25)
          )

          (deflayer base-qwerty
          ;;  esc @a @s @d @f @j @k @l @;
            esc    f1  f2  f3  f4   f5  f6  f7  f8   f9  f10  f11  f12   @cmk
            grv   1    2    3    4    5   6 =   7    8    9    0    -    bspc      ins home pgup
            tab   q    w    e    r    t    [    y    u    i    o    p   '  \       del end  pgdn
            caps  a    s    d    f    g    ]    h    j    k    l    ;     ret
            lsft       x    c    v   b z   /    n    m    ,    .         rsft          up
            lctl   lmet   lalt           @spc           @msl    menu     rctl    lft  down  rght
          )

          (deflayer colemakDH
            esc    f1  f2  f3  f4   f5  f6  f7  f8   f9  f10  f11  f12   @qwt
            grv   1    2    3    4    5   6 =   7    8    9    0    -    bspc      ins home pgup
            tab   q    w    f    p    b    [    j    l    u    y    ;   '  \       del end  pgdn
            caps  a    r    s    t    g    ]    m    n    e    i    o     ret
            lsft       x    c    d   v z   /    k    h    ,    .         rsft           up
            lctl    lmet    lalt         @spc            ralt    menu    rctl     lft  down  rght
          )

          (deflayer secondary
            esc    f1  f2  f3  f4   f5  f6  f7  f8   f9  f10  f11  f12   f13
            grv   1    2    3    4    5   6 =   7    8    9    0    -    bspc      ins home pgup
            tab   q     w    e    r    t    [    y    u    o    o    p   '  \       del end  pgdn
            caps  a    s    d    f    g    ]   lft  down  up  rght  ;     ret
            lsft       x    c    v   b z   /    n    m    ,    .         rsft          up
            lctl   lmet   lalt           @spc           ralt    menu     rctl    lft  down  rght
          )

          (deflayer mouse
            esc    f1  f2  f3  f4   f5  f6  f7  f8   f9  f10  f11  f12   f13
            grv   1    2    3    4    5   6 =   7    8    9    0    -    bspc      ins home pgup
            tab   q   @vsl @slw @fst  t    [    y    u    i    o    p   '  \        del end  pgdn
            caps  a   mrgt mmid mlft  g    ]  @ms<  @msd @msu @ms>  ;     ret
            lsft       x    c    v   b z   /    n    m    ,    .         rsft          up
            lctl   lmet   lalt           @spc           ralt    menu     rctl    lft  down  rght
          )
        '';
      };
    };
  };
}
