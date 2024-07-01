clear
# Inport Port
echo "Port?"
read PORT_VALUE

# Start docker
ENV_NAME="$(basename $PWD)"
docker run -it \
	-p $PORT_VALUE:80 \
	--security-opt seccomp=unconfined \
	--shm-size=512m \
	-v=.:/home/ubuntu/$ENV_NAME \
	--device=/dev \
	--privileged \
	--name $ENV_NAME \
	tiryoh/ros2-desktop-vnc:humble
