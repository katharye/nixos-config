{ config, pkgs, ... }: 

{
  programs.vscode = {
    enable = true;
    
    extensions = with pkgs.vscode-extensions; [
      ms-python.python
      ms-vscode.cpptools
      jnoortheen.nix-ide
    ];

    userSettings = {
      "security.workspace.trust.enabled" = false;
    };
  };
}
