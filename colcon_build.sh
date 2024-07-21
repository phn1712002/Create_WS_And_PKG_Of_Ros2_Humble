# Colcon build
clear
while true; do
read -p "Unset ?:" yn
case $yn in 
	[yY] )
      unset AMENT_PREFIX_PATH
      unset CMAKE_PREFIX_PATH
      break;;
	[nN] )
		break;;
	* ) echo "Invalid response";;
esac
done
clear

source ./install/local_setup.bash
rosdep install --from src -i
echo "===================================================="
read
clear

# Install package python
bash ./setup/setup_py_env.sh
clear

# Colcon build
echo "1. Colcon build"
echo "2. Colcon build with remove build/install/log"
echo "3. Colcon build with packages select"
echo "4. Colcon build with packages skip"
echo "5. Install symlink"
echo "===================================================="
echo "Select?"
read SELECT
case "$SELECT" in
   "1") colcon build
   ;;
   "2") 
   rm -rf build install log
   mkdir build
   touch ./build/.gitignore
   echo '*' > ./build/.gitignore
   touch ./build/COLCON_IGNORE

   mkdir install
   touch ./install/.gitignore
   echo '*' > ./install/.gitignore
   touch ./install/COLCON_IGNORE

   mkdir log
   touch ./log/.gitignore
   echo '*' > ./log/.gitignore
   touch ./log/COLCON_IGNORE
   
   colcon build	
   ;;
   "3")
   echo "Name packages?"
   read NAME_PKG
   colcon build --packages-select $NAME_PKG 
   ;;
   "4") 
   echo "Name packages?"
   read NAME_PKG
   colcon build --packages-skip $NAME_PKG	
   ;;
   "5") 
   rm -rf build install log
   colcon build --symlink-install	
   ;;
esac

source ./install/local_setup.bash
unset AMENT_PREFIX_PATH
unset CMAKE_PREFIX_PATH


