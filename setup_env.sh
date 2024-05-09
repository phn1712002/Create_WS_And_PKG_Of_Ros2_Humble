# ROS2
sudo echo "" >> /root/.bashrc
sudo echo "source /opt/ros/humble/setup.bash" >> /root/.bashrc
sudo echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" >> /root/.bashrc
sudo echo "" >> /root/.bashrc

#System
sudo apt update
sudo apt install python-is-python3 nano jstest-gtk evtest -y

# Echo Complete
clear
echo "Complete !"
rm -f setup_env.sh

#Camera
sudo usermod -aG video $USER
newgrp video

#Audio
sudo usermod -aG audio $USER
newgrp audio

#DialOut
sudo usermod -aG dialout $USER
newgrp dialout

# Edit card
cat /proc/asound/cards
sudo nano /usr/share/alsa/alsa.conf




