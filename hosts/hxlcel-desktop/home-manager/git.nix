{ ... }: {

  programs.git = {
    enable = true;
    userName = "hxlcel";
    userEmail = "hxlcel@proton.me";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
