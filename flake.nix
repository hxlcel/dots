{
  description = "system dotfiles flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Community flake zen install. Disabled to use flatpak, this ver had some issues.
    # zen-browser = {
    #   url = "github:0xc000022070/zen-browser-flake";
    # };

    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprnix.url = "github:hyprland-community/hyprnix";

    sherlock.url = "github:Skxxtz/sherlock";

    stylix.url = "github:danth/stylix/release-24.11";

    tmux-sessionx.url = "github:omerxx/tmux-sessionx";

    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    auto-cpufreq,
    home-manager,
    nixos-hardware,
    nix-flatpak,
    ...
  } @ inputs: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    orcaAppImage = import ./hosts/default/orca.nix {inherit pkgs;};
    # pkgs = nixpkgs.legacyPackages.${system};
    # pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};

    allowed-unfree-packages = [
      "obsidian"
      "vscode"
      "megacmd"
      "p7zip"
      "p7zip-rar"
    ];

    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true;
      };
    };
    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = _:true;
      };
    };
  in {
    nixosConfigurations = {
      hxlcel-desktop = lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit pkgs;
          inherit pkgs-unstable;
          inherit orcaAppImage;
        };
        modules = [
          nix-flatpak.nixosModules.nix-flatpak
          ./hosts/hxlcel-desktop/configuration.nix
          inputs.stylix.nixosModules.stylix
        ];
      };

      hxlcel-surface = lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit pkgs-unstable;
          inherit orcaAppImage;
        };
        modules = [
          nixos-hardware.nixosModules.microsoft-surface-pro-9
          nix-flatpak.nixosModules.nix-flatpak
          ./hosts/hxlcel-surface/configuration.nix
          auto-cpufreq.nixosModules.default
        ];
      };
    };

    homeConfigurations = {
      "hazel@hxlcel-desktop" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
          inherit pkgs-unstable;
        };
        modules = [
          ./hosts/hxlcel-desktop/home-manager
          {
            home.username = "hazel";
            home.homeDirectory = "/home/hazel";
          }
        ];
      };

      "hazel@hxlcel-surface" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
          inherit pkgs-unstable;
        };
        modules = [
          ./hosts/hxlcel-surface/home-manager
          {
            home.username = "hazel";
            home.homeDirectory = "/home/hazel";
          }
        ];
      };
    };
  };
}
