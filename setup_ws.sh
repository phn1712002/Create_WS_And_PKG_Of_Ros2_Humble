clear
# Remove
rm -rf build
rm -rf install
rm -rf log

# Create src
mkdir src

# Create launch
mkdir launch

# Check ws
rosdep install -i --from-path src --rosdistro humble -y

# Build ws
colcon build

# Get pwd
DIR="$( cd "$( dirname "$0" )" && pwd )"

# Echo ~/.bashrc in user ubuntu
echo "" >> /home/ubuntu/.bashrc
echo "#### THIS IS OF [$DIR]" >> /home/ubuntu/.bashrc
echo "source $DIR/install/local_setup.bash" >> /home/ubuntu/.bashrc
echo "########################" >> /home/ubuntu/.bashrc
echo "" >> /home/ubuntu/.bashrc
echo "clear" >> /home/ubuntu/.bashrc

# Remove git
while true; do
read -p "Remove .git? (y/n) " yn
case $yn in 
	[yY] ) echo "Remove .git";
		rm -rf .git
		rm -rf readme.md
		break;;
	[nN] ) echo "No remove .git";
		exit;;
	* ) echo "Invalid Response";;
esac
done
# Echo Complete
clear
history -c 
echo "Complete !"
