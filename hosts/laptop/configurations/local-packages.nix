{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # GPU stuff
    intel-media-driver
    intel-ocl
  ];
}