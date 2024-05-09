# Colcon build
clear
echo "1. Colcon build"
echo "2. Colcon build with remove build/install/log"
echo "3. Colcon build with packages select"
echo "4. Install symlink"
echo "===================================================="
echo "Select?"
read SELECT
case "$SELECT" in
   "1") colcon build
   ;;
   "2") 
   rm -rf build install log
   colcon build	
   ;;
   "3")
   echo "Name packages?"
   read NAME_PKG
   colcon build --packages-select $NAME_PKG 
   ;;
   "4") 
   rm -rf build install log
   colcon build --symlink-install	
   ;;
esac

source ./install/local_setup.bash
