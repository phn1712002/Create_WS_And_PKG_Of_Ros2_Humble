# Colcon build
clear
unset AMENT_PREFIX_PATH
unset CMAKE_PREFIX_PATH
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
