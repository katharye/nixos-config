{
    disko.devices = {
       disk = {
            main = {
                device = "/dev/nvme0n1";
                type = "disk";
                content = {
                    type = "gpt";
                    partitions = {
                        ESP = {
                            type = "EF00";
                            size = "1G";
                            content = {
                                type = "filesystem";
                                format = "vfat";
                                mountpoint = "/boot";
                                mountOptions = [ "umask=0077" ];
                            };
                        };

                        swap = {
                            size = "8G";
                            content = {
                                type = "swap";
                                resumeDevice = true;
                            };
                        };

                        root = {
                            size = "100%";
                            content = {
                                type = "filesystem";
                                format = "ext4";
                                mountpoint = "/";
                            };
                        };
                    };
                };
            };
            #SSD 
            patriot = {
                device = "/dev/disk/by-id/ata-Patriot_P200_256GB_AA000000000000000405";
                type = "disk";
                content = {
                    type = "gpt";
                    partitions = {
                        data = {
                            size = "100%";
                            content = {
                                type = "filesystem";
                                format = "ext4";
                                mountpoint = "/mnt/patriotSSD";
                            };
                        };
                    };
                };
            };
            #HDD
            storage = {
                device = "/dev/disk/by-id/ata-WDC_WD10EFRX-68FYTN0_WD-WCC4J3JD0PVA";
                type = "disk";
                content = {
                    type = "gpt";
                    partitions = {
                        data = {
                            size = "100%";
                            content = {
                                type = "filesystem";
                                format = "ext4";
                                mountpoint = "/mnt/wdHDD";
                            };
                        };
                    };
                };
            };

       };
    };   
}