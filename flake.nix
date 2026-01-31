{
  description = "My NixOS configuration <3";

  inputs = {
    
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

#    nixvim = {
#      url = "github:nix-community/nixvim";
#      inputs.nixpkgs.follows = "nixpkgs";
#    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:

    let
      system = "x86_64-linux";
      homeStateVersion = "25.05";
      user = "katharye";
      hosts = [
        { hostname = "laptop"; stateVersion = "25.05"; }
        { hostname = "PC"; stateVersion = "25.05"; }
      ];

      makeSystem = { hostname, stateVersion}: nixpkgs.lib.nixosSystem {
        system = system;
        specialArgs = {
          inherit inputs stateVersion hostname user;
        };

        modules = [
          ./hosts/${hostname}/configuration.nix
        ];
      };

    in {
      nixosConfigurations = nixpkgs.lib.foldl' (configs: host:
      configs // {
        "${host.hostname}" = makeSystem {
          inherit (host) hostname stateVersion;
        };
      }) {} hosts;


      homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {
          inherit inputs homeStateVersion user;
        };

      modules = [
        ./home-manager/home.nix
      ];
    };
  };
}