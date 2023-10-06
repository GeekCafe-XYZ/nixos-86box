#/bin/bash


echo "Setting up Nix OS Virtual Machine from DigiDevon"
echo "Making VM directory at /vm"
sudo mkdir /vm
echo "Copying files to VM directory"
sudo cp -r * /vm
echo "Installing Configurations to system"
sudo nixos-rebuild switch -I nixos-config=/vm/configuration.nix
echo "Running Garbage Collection"
# sudo nix-collect-garbage -d
echo "Installing flatpak repo is not already installed"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo "Creating autostart dir for win98 user"
## ISSUES WITH CREATING AUTOSTART https://github.com/GeekCafe-XYZ/nixos-86box/issues/1
sudo mkdir /home/win98/.config/autostart
echo "Moving starup files to win98 user"
sudo cp startup-win98.desktop /home/win98/.config/autostart
echo "You must restart your system now"
sudo shutdown -r 1 "Rebooting in 1 minute"
