echo "Updating Flatpak"
flatpak update
echo "Installing 86Box"
flatpak install flathub net._86box._86Box -y
echo "Starting 86Box"
flatpak run net._86box._86Box
echo "Creating Home Directory Folders"
mkdir /home/win98/Floppy\ Disks/
mkdir /home/win98/CDs
exit
