{
  description = "system dotfiles flake";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
    };

    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprnix.url = "github:hyprland-community/hyprnix";

    sherlock.url = "github:Skxxtz/sherlock";

    stylix.url = "github:danth/stylix/release-24.11";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    nixos-hardware,
    ...
    }
    @ inputs:

    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
    in {

      nixosConfigurations = {

        # nixos = lib.nixosSystem {
        #   inherit system;
        #   specialArgs = { 
        #     inherit inputs;
        #     inherit pkgs-unstable;
        #   };
        #   modules = [
        #     ./hosts/hxlcel-desktop/configuration.nix
        #     inputs.stylix.nixosModules.stylix
        #   ];
        # };

        hxlcel-desktop = lib.nixosSystem {
          inherit system;
          specialArgs = { 
            inherit inputs;
            inherit pkgs-unstable;
          };
          modules = [
            ./hosts/hxlcel-desktop/configuration.nix
            inputs.stylix.nixosModules.stylix
          ];
        };

        hxlcel-surface = lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            inherit pkgs-unstable;
          };
          modules = [
            nixos-hardware.nixosModules.microsoft-surface-pro-9
            ./hosts/hxlcel-surface/configuration.nix
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
