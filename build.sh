sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt install -y --fix-missing curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

sudo apt update
sudo apt install -y --fix-missing ros-noetic-desktop-full
apt search ros-noetic

source /opt/ros/noetic/setup.bash
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

sudo apt install -y --fix-missing python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential

sudo apt install -y --fix-missing python3-rosdep

sudo rosdep init
rosdep update

sudo apt install -y --fix-missing python3-pip

pip install -y --fix-missing pyrealsense2
pip install -y --fix-missing opencv-python
pip install -y --fix-missing opencv-contrib-python

source /opt/ros/noetic/setup.bash
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/
catkin_make

catkin_make -DPYTHON_EXECUTABLE=/usr/bin/python3
source devel/setup.bash

echo $ROS_PACKAGE_PATH

cd ~/catkin_ws/src
git clone https://github.com/CopterExpress/clover.git clover

cd ~/catkin_ws/
rosdep install -y --from-paths src --ignore-src

cd ~/catkin_ws
catkin_make -j1

curl https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh | sudo bash

cd ~/catkin_ws/src/clover/clover/udev
sudo cp 99-px4fmu.rules /lib/udev/rules.d
