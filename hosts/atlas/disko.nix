{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/sda";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              name = "ESP";
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                # Монтируем ESP прямо в /boot под systemd-boot
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
                extraArgs = [ "-n" "ESP" ]; # метка для удобства (LABEL=ESP)
              };
            };

            cryptroot = {
              name = "cryptroot";
              size = "100%";
              content = {
                type = "luks";
                name = "cryptroot"; # имя маппера в /dev/mapper/cryptroot
                # ВАЖНО: никаких keyFile — будет интерактивный пароль
                settings = {
                  allowDiscards = true; # TRIM для SSD (на HDD не мешает)
                };
                content = {
                  type = "btrfs";
                  extraArgs = [ "-f" "-L" "NIXROOT" ]; # метка Btrfs (LABEL=NIXROOT)
                  subvolumes = {
                    "/root" = {
                      mountpoint = "/";
                      mountOptions = [ "compress=zstd" "noatime" "space_cache=v2" ];
                    };
                    "/home" = {
                      mountpoint = "/home";
                      mountOptions = [ "compress=zstd" "noatime" "space_cache=v2" ];
                    };
                    "/nix" = {
                      mountpoint = "/nix";
                      mountOptions = [ "compress=zstd" "noatime" "space_cache=v2" ];
                    };
                    "/var/log" = {
                      mountpoint = "/var/log";
                      mountOptions = [ "compress=zstd" "noatime" "space_cache=v2" ];
                    };
                    "/var/tmp" = {
                      mountpoint = "/var/tmp";
                      mountOptions = [ "compress=zstd" "noatime" "space_cache=v2" ];
                    };
                    "/swap" = {
                      # отдельный подтом под swap-файл
                      mountpoint = "/.swapvol";
                      # disko сам создаст swap-файл корректно (без COW и с нужными флагами)
                      swap.swapfile.size = "8G";
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
