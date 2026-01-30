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
        position = "left";
        margin = "0";

        modules-left   = [ "custom/powermenu" "hyprland/workspaces" "hyprland/language" ];
        modules-center = [ "clock" ];
        modules-right  = [ "pulseaudio" "backlight" "network" "battery" ];

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
          format = "{:%H\n%M\n──\n%d\n%m}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "custom/powermenu" = {
          format = "⏻";
          on-click = "wlogout --protocol layer-shell";
          tooltip = "Power menu";
        };

        "pulseaudio" = {
          reverse-scrolling = 1;
          format = "{icon}";
          format-muted = " {format_source}";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" "" ];
          };
          tooltip-format = "{volume}%";
          on-click = "pavucontrol";
          min-length = 1;
        };

        "network" = {
          format-wifi = "";
          format-ethernet = "";
          format-disconnected = "";
          tooltip-format = ''
            {ifname}, {essid}
            : {bandwidthDownBytes}
            : {bandwidthUpBytes}
            IP: {ipaddr}
          '';
          on-click = "nm-connection-editor";
        };

        "backlight" = {
          device = "intel_backlight";
          format = "{icon}";
          format-icons = [ "󰃜" "󰃛" "󰃚" ];
          tooltip-format = "{percent}%";
          min-length = 1;
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon}";
          format-charging = "󰂄";
          format-plugged = "";
          format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󱈏"];
          on-update = "$HOME/.config/waybar/scripts/check_battery.sh";
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
        min-width: 1px;
      }

      tooltip {
          background-color: @background;
          color: @foreground;
          border-radius: 8px;
          padding: 2px 10px 6px 10px;
          font-family: "JetBrains Mono", monospace;
          font-size: 12px;
          box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
      }

      window#waybar {
        background: @background;
      }

      window#waybar.hidden {
        opacity: 0.2;
      }

      /* === Workspaces === */
      #workspaces {
        background: @color1;
        border-radius: 7px;
        margin: 4px 8px;
        padding: 2px 4px 4px 4px;
      }

      #workspaces button,
      #workspaces button:hover,
      #workspaces button.active {
        outline: none;
        border: none;
        box-shadow: none;

        color: @background;
        border-radius: 7px;
        padding: 0px;
        font-size: 14px;
        min-width: 10px; 
        margin: 4px 0px 0px 0px;
      }

      #workspaces button {
        background: @color4;
      }

      #workspaces button:hover {
        background: @color3;
      }

      #workspaces button.active {
        background: @background;
        color: @color4;
      }

      /* === Common modules === */
      #clock,
      #network,
      #pulseaudio,
      #backlight,
      #battery,
      #language,
      #custom-powermenu {
        background: @color1;
        color: @background;
        border-radius: 7px;
        margin: 4px 8px;
        font-size: 16px;

        min-width: 10px; 
        min-height: 30px;
      }

      #clock {
        padding: 5px 0px;
      }

      #language {
        font-size: 14px;
      }

      /* === Special Conditions === */
      #custom-powermenu:hover {
        background: @color2;
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
      }
    '';
  };
}