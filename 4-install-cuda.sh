# Install CUDA
sudo apt-get update
sudo apt-get install -y cuda

# Add environmental variables
echo >> .bashrc
echo "export CUDA_HOME=/usr/local/cuda" >> .bashrc
echo "export CUDA_ROOT=/usr/local/cuda" >> .bashrc
echo "export PATH=$PATH:/usr/local/cuda/bin:$HOME/bin" >> .bashrc
echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64" >> .bashrc

# Install Nvidia-driver
# Relace version with appropriate version for your hardware
sudo apt-get install -y nvidia-version-*
