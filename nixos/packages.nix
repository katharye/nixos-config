{ pkgs, pkgs-stable, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  };

  environment.systemPackages = with pkgs; [
    # Desktop apps
    chromium
    ayugram-desktop 
    kitty
    zoom-us
    wofi
    kdePackages.dolphin
    mpv
    spotify
    libreoffice
    discord 

    # Codding stuff
    nodejs_24
    direnv
    nix
    clang-tools
    gnumake
    gcc
    SDL2
    SDL2.dev
    pkg-config
    python
    python3
    docker

    # CLI utils
    gemini-cli
    bat
    vim
    vscode
    neofetch
    file
    tree 
    wget
    git 
    fastfetch
    btop
    nix-index
    unzip
    scrot
    light
    lux
    mediainfo
    ranger
    zram-generator
    cava
    zip
    ntfs3g
    brightnessctl
    swww
    lazygit
    bluez
    bluez-tools
    zsh-powerlevel10k


    # GUI utils
    feh
    imv
    dmenu
    mako

    # Wayland stuff
    xwayland
    wl-clipboard
    cliphist

    # WMs and stuff
    hyprland
    seatd
    xdg-desktop-portal-hyprland
    waybar

    # Sound
    pipewire
    pulseaudio
    pamixer

    # GPU stuff
    intel-media-driver
    intel-ocl
    
    # Screenshotting
    grim
    grimblast
    slurp
    #frameshot
    swappy

    # Other
    amnezia-vpn
    nix-init
    home-manager
    catppuccin-kvantum
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    papirus-nord
  ];
  
  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    nerd-fonts.symbols-only 
  ];
}

