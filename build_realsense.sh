sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade

sudo update-grub && sudo reboot

sudo apt-get install git libssl-dev libusb-1.0-0-dev pkg-config libgtk-3-dev

sudo apt-get install libglfw3-dev libgl1-mesa-dev libglu1-mesa-dev

git clone https://github.com/IntelRealSense/librealsense

cd librealsense/

sudo cp config/99-realsense-libusb.rules /etc/udev/rules.d/

sudo udevadm control --reload-rules
sudo udevadm trigger

./scripts/patch-realsense-ubuntu-xenial-joule.sh

