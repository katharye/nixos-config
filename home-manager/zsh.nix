{ config, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = 
      let 
        flakeDir = "~/nix";
      in {
        rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
        upd = "nix flake update ${flakeDir}";
        upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";
            
        hms = "home-manager switch --flake ${flakeDir}";

        nf = "neofetch";

        c = "code";
        direnvAllow = "echo 'use nix' > .envrc && direnv allow";
        slp = "sudo systemctl suspend";
      };
    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    # oh-my-zsh = {
    #   enable = true;
    #   plugins = [ "git" "sudo" "python"];
    # };

    

    initExtra = ''
      eval "$(starship init zsh)"
    '';
  };

  home.packages = with pkgs; [
    starship
  ];
}
