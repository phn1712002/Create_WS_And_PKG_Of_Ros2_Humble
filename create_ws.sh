clear
# Remove
rm -rf build
rm -rf install
rm -rf log

# Create
mkdir src
mkdir bag
mkdir launch
mkdir firmware
mkdir setup

# Check ws
rosdep install -i --from-path src --rosdistro humble -y

# Build ws
colcon build

# Get pwd
DIR="$( cd "$( dirname "$0" )" && pwd )"
# Echo /home/ubuntu/.bashrc in user ubuntu
echo "" >> /home/ubuntu/.bashrc
echo "#### THIS IS OF [$DIR]" >> /home/ubuntu/.bashrc
echo "source $DIR/install/local_setup.bash" >> /home/ubuntu/.bashrc
echo "########################" >> /home/ubuntu/.bashrc
echo "" >> /home/ubuntu/.bashrc
echo "clear" >> /home/ubuntu/.bashrc


# Echo /root/.bashrc in user ubuntu
sudo echo "" >> /root/.bashrc
sudo echo "#### THIS IS OF [$DIR]" >> /root/.bashrc
sudo echo "source $DIR/install/local_setup.bash" >> /root/.bashrc
sudo echo "########################" >> /root/.bashrc
sudo echo "" >> /root/.bashrc
sudo echo "clear" >> /root/.bashrc

# ROS Agent
git clone -b $ROS_DISTRO https://github.com/micro-ROS/micro_ros_setup.git src/micro_ros_setup

# Update dependencies using rosdep
sudo apt update && rosdep update
rosdep install --from-paths src --ignore-src -y

# Build micro-ROS tools and source them
colcon build
source install/local_setup.bash

# Download micro-ROS-Agent packages
ros2 run micro_ros_setup create_agent_ws.sh

# Build step
git config --global --add safe.directory /home/ubuntu/uROS2_ws/build/micro_ros_agent/agent/src/xrceagent
ros2 run micro_ros_setup build_agent.sh
source install/local_setup.bash 

# Install requirements.txt
pip install -r setup/requirements.txt

# Remove git
while true; do
read -p "Remove .git? (y/n) " yn
case $yn in 
	[yY] ) echo "Remove .git";
		rm -rf .git
		rm -rf readme.md
		break;;
	[nN] ) echo "No remove .git";
		break;;
	* ) echo "Invalid Response";;
esac
done

# Echo Complete
clear
echo "Complete !"
