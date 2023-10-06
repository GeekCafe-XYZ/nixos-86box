# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/configuration.nix
    ];

  # Enable the XFCE Desktop Environment.
  services.xserver.displayManager = {
    lightdm.enable = true;
    xfce.enable = true;
    autoLogin.user = "win98";
  };
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.win98 = {
    isNormalUser = true;
    description = "win98";
    extraGroups = [ "networkmanager" "wheel" ];
    password = "win98";
    packages = with pkgs; [
      firefox
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System Software
  environment.systemPackages = [
    pkgs.flatpak # Flatpak support
    pkgs.git # Allow user to download packages
    pkgs.xarchiver # Allow user to unzip zips/7zip
  ];

  services.flatpak.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ 
      pkgs.xdg-desktop-portal-kde 
    ];
  };
}
