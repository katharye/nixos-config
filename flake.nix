{
  description = "This is my first NixOS configuration <3";

  inputs = {
    
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:

    let
      system = "x86_64-linux";
    in {
      
      # nixos - system hostname
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
	specialArgs = {
	  unstable = import nixpkgs-unstable {
    	    inherit system;
	    config.allowUnfree = true;
	  };
	  inherit inputs system;
        };
	modules = [
	  ./nixos/configuration.nix
	  inputs.nixvim.nixosModules.nixvim
	];
      };

      homeConfigurations.katharye = home-manager.lib.homeManagerConfiguration {
	pkgs = nixpkgs.legacyPackages.${system};
	modules = [ ./home-manager/home.nix];
      };
    };
}
