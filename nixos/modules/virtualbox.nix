{
    virtualisation.virtualbox.host.enable = true;
    users.extraGroups.vboxusers.members = [ "katharye" ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
}