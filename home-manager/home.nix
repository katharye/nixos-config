{ config, pkgs, ... }: {
  home = {
    username = "katharye";
    homeDirectory = "/home/katharye";
    stateVersion = "25.05";
  };
	
  imports = [
    ./modules
	  ./zsh.nix
  ];

}
