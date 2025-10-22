{ config, pkgs, ... }: 

{
  nixpkgs.config.allowUnfree = true;

  programs.vscode = {
    enable = true;
   
    profiles.default = { 
      extensions = with pkgs.vscode-extensions; [
        ms-python.python
        ms-vscode.cpptools
        jnoortheen.nix-ide
      ];

      userSettings = {
        "security.workspace.trust.enabled" = false;
      };
    };
  };
}
