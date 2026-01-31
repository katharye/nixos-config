{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  # Graphics
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # X-server
  services = {
    displayManager.sddm.enable = true;
    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];
    };
  };

  # NVIDIA 
  hardware.nvidia = {
    modesetting.enable = true;     
    open = false;                 
    powerManagement.enable = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.production;
  };

  # Wayland 
  environment.sessionVariables = {
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  boot.kernelParams = [ "nvidia-drm.modeset=1" ];

  # environment.systemPackages = with pkgs; [ nvidia-settings nvtop ];
}
