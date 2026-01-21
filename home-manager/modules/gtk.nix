{ config, pkgs, ... }:

let
  wal = import ../colors.nix;
in
{
  home.file.".config/gtk-3.0/gtk.css".text = ''
    /* === Контекстное меню и popover'ы для Waybar и других GTK-приложений === */
    menu,
    .context-menu,
    popover {
      background-color: ${wal.background};
      color: ${wal.foreground};
      border-radius: 10px;
      padding: 6px;
      font-family: "JetBrains Mono Nerd Font", monospace;
      font-size: 13px;
      border: none;
    }

    menuitem {
      padding: 8px 14px;
      border-radius: 8px;
      margin: 2px 0;
    }

    menuitem:hover {
      background-color: ${wal.color8};
      color: ${wal.background};
    }

    menuitem:disabled {
      color: ${wal.color8};
    }

    /* Для GTK4 (Waybar >= 0.10) */
    window.popup > menu,
    window > popover.menu {
      background-color: ${wal.background} !important;
      color: ${wal.foreground} !important;
    }
  '';

  home.file.".config/gtk-4.0/gtk.css".text = ''
    /* === GTK4 === */
    menu,
    .context-menu,
    popover {
      background-color: ${wal.background};
      color: ${wal.foreground};
      border-radius: 10px;
      padding: 6px;
      font-family: "JetBrains Mono Nerd Font", monospace;
      font-size: 13px;
      border: none;
    }

    menuitem {
      padding: 8px 14px;
      border-radius: 8px;
      margin: 2px 0;
    }

    menuitem:hover {
      background-color: ${wal.color8};
      color: ${wal.background};
    }

    menuitem:disabled {
      color: ${wal.color8};
    }
  '';
}