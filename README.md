# NixOS Configuration

This repository contains a NixOS configuration using flakes.

## Installation

1.  **Boot from a NixOS installer.**

2.  **Switch to the root user:**
    ```bash
    sudo -i
    ```

3.  **Check network connectivity:**
    ```bash
    ping nixos.org
    ```

4.  **Clone your configuration repository:**
    (Replace `<your-repo-url>` with the actual URL of your repository)
    ```bash
    git clone <your-repo-url> /mnt/etc/nixos
    ```
    If you don't have a repository, you'll need to get these configuration files into `/mnt/etc/nixos` on the installer machine.

5.  **Partition the disks using Disko:**
    Navigate to your configuration directory and run `disko`. This will format the disks according to the layout defined in `hosts/atlas/disko.nix`.

    **WARNING: This will wipe the target disk.** Make sure you have selected the correct disk in your `disko.nix`.

    ```bash
    nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /mnt/etc/nixos/hosts/atlas/disko.nix
    ```

6.  **Install NixOS:**
    Run the `nixos-install` command, pointing it to your `flake.nix` and the specific host configuration (`atlas` in this case).

    ```bash
    nixos-install --flake /mnt/etc/nixos#atlas
    ```

7.  **Reboot:**
    After the installation is complete, you can reboot into your new system.

    ```bash
    reboot
    ```

## Post-installation

After rebooting, your system should be running the configuration you defined. To update your system in the future, you can pull changes to your repository and run:

```bash
sudo nixos-rebuild switch --flake .#atlas
```
