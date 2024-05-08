@echo off
set ENV_NAME=%cd%
for %%a in (%ENV_NAME%) do set ENV_NAME=%%~na

rem Port
echo Port:
set /p PORT_VALUE=


rem Start Docker
docker run -it -p %PORT_VALUE%:80 --security-opt seccomp=unconfined --shm-size=512m -v=%cd%:/home/ubuntu/%ENV_NAME% --device=/dev --privileged --name %ENV_NAME% tiryoh/ros2-desktop-vnc:humble

rem Complete
cls
echo Complete
del setup_docker_win.bat
del setup_docker.sh
