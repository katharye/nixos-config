{config, pkgs, ...}:

let
    wal = import ../colors.nix;
in {
    programs.kitty = {
        enable = true;
        settings = {
            #close window without confirmation
            confirm_os_window_close = 0;
            #fonts 
            font_family = "JetBrains Mono Nerd Font";
            font_size = 12;
            bold_font = "auto";
            italic_font = "auto";
            bold_italic_font = "auto";
            #scrolling 
            scrollback_lines = 10000;
            wheel_scroll_multiplier = 5.0;
            window_margin_width = 5;
            
            background = wal.background;
            foreground = wal.foreground;
            
            color0  = wal.color0;
            color1  = wal.color1;
            color2  = wal.color2;
            color3  = wal.color3;
            color4  = wal.color4;
            color5  = wal.color5;
            color6  = wal.color6;
            color7  = wal.color7;
            color8  = wal.color8;
            color9  = wal.color9;
            color10 = wal.color10;
            color11 = wal.color11;
            color12 = wal.color12;
            color13 = wal.color13;
            color14 = wal.color14;
            color15 = wal.color15;
            extraConfig = ''
              enable_audio_bell no          
              visual_bell_duration 0.0
            '';
        };
    };
}
