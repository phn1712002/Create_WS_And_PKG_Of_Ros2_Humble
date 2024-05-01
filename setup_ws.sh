# Create venv of c++
mkdir cpp_venv

# Create venv of python
python3 -m venv ./py_venv --system-site-packages

# Check ws
rosdep install -i --from-path src --rosdistro humble -y

# Build ws
colcon build

# Get pwd
DIR="$( cd "$( dirname "$0" )" && pwd )"

# Echo ~/.bashrc in user ubuntu
echo "" >> /home/ubuntu/.bashrc
echo "#### THIS IS OF [$DIR]" >> /home/ubuntu/.bashrc
echo "cd $DIR" >> /home/ubuntu/.bashrc
echo "source $DIR/install/local_setup.bash" >> /home/ubuntu/.bashrc
echo "source $DIR/py_venv/bin/activate" >> /home/ubuntu/.bashrc
echo "########################" >> /home/ubuntu/.bashrc
echo "" >> /home/ubuntu/.bashrc

# Echo ~/.bashrc in user root
echo "" >> /root/.bashrc
echo "#### THIS IS OF [$DIR]" >> /root/.bashrc
echo "source $DIR/install/local_setup.bash" >> /root/.bashrc
echo "########################" >> /root/.bashrc
echo "" >> /root/.bashrc

# Remove git
rm -rf .git

# Echo Complete
echo "Complete !"