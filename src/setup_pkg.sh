# Create package
echo "Name of package?"
read PKG_NAME
ros2 pkg create --build-type ament_cmake $PKG_NAME

# Env pkg python and C++
DIR="$( cd "$( dirname "$0" )" && pwd )"
cp $DIR/CMakeLists $DIR/$PKG_NAME/CMakeLists.txt
cp $DIR/package $DIR/$PKG_NAME/package.xml

cd $PKG_NAME
mkdir py_src
mkdir py_package
mkdir launch
touch requirements.txt


# Echo Complete
echo "Complete !"
