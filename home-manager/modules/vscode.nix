{ config, pkgs, ... }: 

{
  nixpkgs.config.allowUnfree = true;

  programs.vscode = {
    enable = true;
   
    profiles.default = { 
      extensions = with pkgs.vscode-extensions; [
        #Python
        ms-python.python
        #C/C++
        ms-vscode.cpptools
        #Nix
        jnoortheen.nix-ide
        #Databases
        yy0931.vscode-sqlite3-editor
      ];

      userSettings = {
        "security.workspace.trust.enabled" = false;
        "files.autoSave" = "afterDelay";
      };
    };
  };
}
