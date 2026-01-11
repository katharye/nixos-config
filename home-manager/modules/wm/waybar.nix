{ config, pkgs, ... }:

let
  wal = import ../../colors.nix;
in
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin = "9 13 -10 18";

        modules-left = [ "clock" "hyprland/language" ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [ "pulseaudio" "backlight" "network" "battery" "tray" "custom/powermenu" ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          on-click = "activate";
        };

        "hyprland/language" = {
          format-en = "US";
          format-ru = "RU";
          min-length = 3;
          tooltip = false;
        };

        "clock" = {
          format = "{:%a, %d %b %I:%M %p}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "custom/powermenu" = {
          format = "⏻";
          on-click = "wlogout --protocol layer-shell";
          tooltip = "Power menu";
        };

        "pulseaudio" = {
          reverse-scrolling = 1;
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" "" ];
          };
          on-click = "pavucontrol";
          min-length = 13;
        };

        "network" = {
          format-wifi = " {essid}";
          format-ethernet = " Ethernet";
          format-disconnected = " Offline";
          tooltip-format = ''
            {ifname}
            : {bandwidthDownBytes}
            : {bandwidthUpBytes}
            IP: {ipaddr}
          '';
          on-click = "nm-connection-editor";
        };

        "backlight" = {
          device = "intel_backlight";
          format = "{percent}% {icon}";
          format-icons = [ "󰃠" ];
          min-length = 7;
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% ⚡";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-icons = [ "" "" "" "" "" "" "" "" "" "" ];
          on-update = "$HOME/.config/waybar/scripts/check_battery.sh";
        };

        "tray" = {
          icon-size = 16;
          spacing = 0;
        };
      };
    };

    style = ''
      /* === Colors === */
      @define-color background ${wal.background};
      @define-color foreground ${wal.foreground};
      @define-color color0 ${wal.color0};
      @define-color color1 ${wal.color1};
      @define-color color2 ${wal.color2};
      @define-color color3 ${wal.color3};
      @define-color color4 ${wal.color4};
      @define-color color5 ${wal.color5};
      @define-color color6 ${wal.color6};
      @define-color color7 ${wal.color7};
      @define-color color8 ${wal.color8};
      @define-color color9 ${wal.color9};
      @define-color color10 ${wal.color10};
      @define-color color11 ${wal.color11};
      @define-color color12 ${wal.color12};
      @define-color color13 ${wal.color13};
      @define-color color14 ${wal.color14};
      @define-color color15 ${wal.color15};

      * {
        border: none;
        border-radius: 0;
        font-family: JetBrains Mono Nerd Font;
        font-weight: bold;
        min-height: 20px;
      }

      window#waybar {
        background: transparent;
      }

      window#waybar.hidden {
        opacity: 0.2;
      }

      /* === Workspaces === */
      #workspaces {
        background: @background;
        border-radius: 20px;
        padding: 0 0px;
      }

      #workspaces button {
        color: @foreground;
        background: transparent;
        padding: 5px 8px;
        margin: 0 0px;
        font-size: 16px;
        min-width: 20px; 
      }

      #workspaces button:hover {
        box-shadow: inherit;
        text-shadow: inherit;
        background: @color8;
        color: @background;
        border-radius: 20px;
      }

      #workspaces button.active {
        background: @color4;
        color: @background;
        border-radius: 20px;
      }

      /* === Common modules === */
      #clock,
      #network,
      #pulseaudio,
      #backlight,
      #battery,
      #language,
      #custom-powermenu,
      #tray {
        background: @background;
        color: @foreground;
        border-radius: 20px;
        padding-left: 16px;
        padding-right: 16px;
        margin-right: 8px;
      }

      /* === Special Conditions === */
      #custom-powermenu:hover {
        background: @background;
        color: @foreground;
      }

      #battery.charging {
        background: @color2;
        color: @foreground;
      }

      #battery.warning:not(.charging) {
        background: @color3;
        color: @background;
      }

      #battery.critical:not(.charging) {
        background: @color1;
        color: @foreground;
        /* animation: blink 0.5s linear infinite alternate; */
      }

      @keyframes blink {
        to {
          background: @foreground;
          color: @background;
        }
      }
    '';
  };
}