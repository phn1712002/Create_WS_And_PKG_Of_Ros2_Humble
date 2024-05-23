# 
mkdir firmware

# Setting pio
wget -O get-platformio.py https://raw.githubusercontent.com/platformio/platformio-core-installer/master/get-platformio.py
python3 get-platformio.py
rm -rf get-platformio.py

# ROS Agent
git clone -b $ROS_DISTRO https://github.com/micro-ROS/micro_ros_setup.git src/micro_ros_setup

# Echo /home/ubuntu/.bashrc in user ubuntu
echo "" >> /home/ubuntu/.bashrc
echo "#### THIS IS OF PlatformIO" >> /home/ubuntu/.bashrc
echo "export PATH=\$PATH:/root/.platformio/penv/bin" >> /home/ubuntu/.bashrc
echo "########################" >> /home/ubuntu/.bashrc
echo "" >> /home/ubuntu/.bashrc

# Echo /root/.bashrc in user ubuntu
sudo echo "" >> /root/.bashrc
sudo echo "#### THIS IS OF PlatformIO" >> /root/.bashrc
sudo echo "export PATH=\$PATH:/root/.platformio/penv/bin" >> /root/.bashrc
sudo echo "########################" >> /root/.bashrc
sudo echo "" >> /root/.bashrc


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

rm -rf setup_platformio.sh
