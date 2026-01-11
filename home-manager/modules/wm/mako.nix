{ config, pkgs, ...}:

let
    wal = import ../../colors.nix;
in {
    services.mako = {
        enable = true;

        settings = {
            #style 
            background-color = wal.background;
            border-color = wal.color8;
            border-radius = 10;
            border-size = 2;
            progress-color = "over ${wal.color4}";
            text-color = wal.foreground;

            #size
            width = 300;
            height = 120;
            margin = "20";
            padding = "20";

            default-timeout = 5000;
            anchor = "top-right";
            font = "JetBrains Mono Nerd Font 10";

            format = "<b>%s</b>\\n%b";
            max-icon-size = 64;

            group-by = "app-name,summary";
            sort = "-time";
        };
    };
}