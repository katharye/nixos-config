let
  wal = import ../../colors.nix;
  hexToRgba = hex: "rgba(" + (builtins.substring 1 6 hex) + "ff)";
  hexToRgbaAlpha = hex: alpha: "rgba(" + (builtins.substring 1 6 hex) + alpha + ")";
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      "$mainMod" = "SUPER";

      monitor = ",1920x1080@60,auto,1";

      env = [
	"XDG_CURRENT_DESKTOP=Hyprland"
	"XDG_SESSION_TYPE=wayland"
	"XDG_SESSION_DESKTOP=Hyprland"
	"XCURSOR_SIZE=36"
	"QT_QPA_PLATFORM=wayland"
	"XDG_SCREENSHOTS_DIR=~/screens"
      ];

      debug = {
	disable_logs = false;
	enable_stdout_logs = true;
      };

      input = {
	kb_layout  = "us,ru"; 
	kb_options = "grp:win_space_toggle";

	follow_mouse = 1;

	touchpad = {
	  natural_scroll = true;
	};

	sensitivity = 0; # Take values -1.0 - 1.0, 0 means no modification
      };
      
      general = {
        gaps_in = 5;
        gaps_out = 15;
        border_size = 2;
        "col.active_border" = "${hexToRgba wal.color4} ${hexToRgba wal.color5} 45deg";
        "col.inactive_border" = "${hexToRgba wal.color8}";
        layout = "dwindle";
      };

       decoration = {
	rounding = 10;

  # if $(cat ~/.cache/current-stage) then
  # 	active_opacity = 0.85;
  # 	inactive_opacity = 0.6;
  # 	fullscreen_opacity = 1.0;

  # 	blur = {
  # 	  enabled = true;
  # 	  size = 10;
  # 	  passes = 3;
  #     ignore_opacity = true;
  #     noise = 0.02;
  #     contrast = 1.0;
  #     brightness = 1.2;
  #     xray = false;
  # 	  new_optimizations = true;
  #   };
  # else
  #   blur.enabled = false;
 
	shadow = {
	  enabled = true;
          range = 4;
	  render_power = 3;
	  color = "0xee1a1a1a";
	};
      };

      animations = {
	enabled = true;
	
	# bezier = "myBezier, 0.68, -0.6, 0.32, 1.6";
	# bezier = "myBezier, 0.34, 1.56, 0.64, 1";
  # bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
  # bezier = "myBezier, 0.33, 0.82, 0.9, -0.08";
  bezier = "myBezier, 0.05, 0.5, 0.1, 1.1";
  
	animation = [
	  "windows,       1, 2, myBezier"
	  "windowsOut,    1, 2, default, popin 80%"
	  "border,        1, 5, default"
	  "borderangle,   1, 5, default"
	  "fade,          1, 5, default"
	  "workspaces,    1, 3, default, slide"
	  # "workspacesIn,  1, 3, default, slide"
	  # "workspacewOut, 1, 3, default, slide"
	];
      };
    
      dwindle = {
        pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # you probably want this
      };
 
     # master = {
     #	new_is_master = true;
     # };
	
      gestures = {
	workspace_swipe = true;
	workspace_swipe_fingers = 3;
	workspace_swipe_invert = false;
  #	workspace_swipe_distnce = 200;
	workspace_swipe_forever = true;
      };

      misc = {
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
        enable_swallow = true;
        # render_ahead_of_time = false;
        disable_hyprland_logo = true;
      };	

      windowrulev2 = [
        "float, class:^(imv)$"
        "float, class:^(mpv)$"
      ];

      exec-once = [
        "swww-daemon"
        "swww img $(cat ~/.cache/current-wallpaper)"
        "waybar"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

      bind = [
	"$mainMod, T, exec, kitty"
	"$mainMod, Q, killactive,"
	"$mainMod, B, exec, chromium"
	"$mainMod, C, exec, ayugram-desktop"
  "$mainMod, V, exec, AmneziaVPN"
  "$mainMod, D, exec, wofi --show drun"
  "$mainMod, E, exec, dolphin"
  "$mainMod, W, togglefloating"

  # Full screen
    "SUPER, PRINT, exec, grim ~/Pictures/full-$(date +%s).png && wl-copy < ~/Pictures/full-$(date +%s).png"
    
  # Area (с Ctrl)
    "CTRL, PRINT, exec, grim -g \"$(slurp)\" ~/Pictures/area-$(date +%s).png && wl-copy < ~/Pictures/area-$(date +%s).png"

  # Move focus with mainMod + arrow keys
        "$mainMod, left,  movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up,    movefocus, u"
        "$mainMod, down,  movefocus, d"

	# Moving windows
        "$mainMod SHIFT, left,  swapwindow, l"
        "$mainMod SHIFT, right, swapwindow, r"
        "$mainMod SHIFT, up,    swapwindow, u"
        "$mainMod SHIFT, down,  swapwindow, d"

        # Window resizing                     X  Y
        "$mainMod CTRL, left,  resizeactive, -60 0"
        "$mainMod CTRL, right, resizeactive,  60 0"
        "$mainMod CTRL, up,    resizeactive,  0 -60"
        "$mainMod CTRL, down,  resizeactive,  0  60"

	# Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod SHIFT, 0, movetoworkspacesilent, 10"

	# Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

	# Keyboard backlight
        "$mainMod, F3, exec, brightnessctl -d *::kbd_backlight set +33%"
        "$mainMod, F2, exec, brightnessctl -d *::kbd_backlight set 33%-"

        # Volume and Media Control
        ", XF86AudioRaiseVolume, exec, pamixer -i 5 "
        ", XF86AudioLowerVolume, exec, pamixer -d 5 "
        ", XF86AudioMute, exec, pamixer -t"
        ", XF86AudioMicMute, exec, pamixer --default-source -m"
        
        # Brightness control
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%- "
        ", XF86MonBrightnessUp, exec, brightnessctl set +5% "
	
      ];

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };  
}
