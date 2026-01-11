{ config, pkgs, ... }:

let
  wal = import ../../colors.nix; 
in
{
  programs.wofi = {
    enable = true;
    
    settings = {
      width = 800;
      height = 500;
      location = "center";
      show = "drun";
      prompt = "";
      insensitive = true;
      show_images = true;
      image_size = 24;
    };
    
    style = ''
      * {
        font-family: "JetBrains Mono Nerd Font";
        font-size: 18px;
        margin: 0;
        padding: 0;
      }
      
      window {
        margin: 0px;
        border-radius: 20px;
        background-color: transparent;
        overflow: hidden
      }
      
      #input {
        margin: 10px;
        padding: 10px;
        border: 2px solid ${wal.color8};
        border-radius: 20px;
        color: ${wal.foreground};
        background-color: ${wal.background};
      }
      
      #inner-box {
        margin: 10px;
        border: none;
        border-radius: 20px;
        background-color: transparent;
      }

      #outer-box{
        border: 2px solid ${wal.color8};  
        border-radius: 20px;
        background-color: ${wal.background};
      }
      #entry {
        margin: 10px;
        padding: 10px;
        border: none;
        border-radius: 20px;
        color: ${wal.foreground};
        background-color: transparent;
      }
      
      #entry:selected {
        background-color: ${wal.color8};
        color: ${wal.foreground};
        border-radius: 20px;
      }

      #scroll {
        margin: 5px;
        border: none;
        border-radius: 20px;
        background-color: transparent;
        padding: 0;
      }
      
      #scroll slider {
        min-width: 4px;
        min-height: 4px;
        background-color: ${wal.color8};
        border-radius: 2px;
        margin: 2px; 
      }
      
      #scroll slider:hover {
        background-color: ${wal.color4};
      }
      
      #scroll slider:active {
        background-color: ${wal.color2};
      }
    '';
  };
}