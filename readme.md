
# Templete create workspace and package of ROS2

Docker using : https://github.com/Tiryoh/docker-ros2-desktop-vnc


## Authors

- [@phn1712002](https://github.com/phn1712002)


## Usage
Open termial 
```bash
    # Downloader folder
    git clone https://github.com/phn1712002/Create_ws_and_pkg_of_ros2.git
    
    # Change [name_ws] to the desired name
    mv Create_ws_and_pkg_of_ros2 [name_ws]

    # Setup workspace
    cd [name_ws]
    bash setup_ws.sh
    exit

    # Setup package
    cd [name_ws]/src
    bash setup_pkg.sh
```
    
## Note => Need to be adjusted.
1.[name_ws]/src/[package_name]/package.xml
```xml
<?xml version="1.0"?>
<?xml-model href="http://download.ros.org/schema/package_format3.xsd" schematypens="http://www.w3.org/2001/XMLSchema"?>
<package format="3">
  <name>[name_package]</name> -> #This
  ...
  <export>
    <build_type>ament_cmake</build_type>
  </export>
</package>
```

2.[name_ws]/src/[package_name]/CMakeLists.txt
```c++
cmake_minimum_required(VERSION 3.8)
#project([name_package]) -> This

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()
  ...
ament_package()
```

