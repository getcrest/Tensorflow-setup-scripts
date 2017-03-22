# 1.Install dependencies
sudo apt-get update
sudo apt-get install -y wget python-pip python-dev unzip
sudo pip install six numpy wheel


# 2.Install Java

# Permissions needed
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update

# Hack to silently agree license agreement
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get install -y oracle-java8-installer


# 3.Install Bazel

# Taken from official Tensorflow Repository

# Select bazel version.
BAZEL_VERSION="0.4.2"

set +e
local_bazel_ver=$(bazel version 2>&1 | grep -i label | awk '{print $3}')

if [[ "$local_bazel_ver" == "$BAZEL_VERSION" ]]; then
  exit 0
fi

set -e

mkdir -p /bazel
cd /bazel
if [[ ! -f "bazel-$BAZEL_VERSION-installer-linux-x86_64.sh" ]]; then
  curl -fSsL -O https://github.com/bazelbuild/bazel/releases/download/$BAZEL_VERSION/bazel-$BAZEL_VERSION-installer-linux-x86_64.sh
fi
chmod +x /bazel/bazel-*.sh
/bazel/bazel-$BAZEL_VERSION-installer-linux-x86_64.sh
rm -f /bazel/bazel-$BAZEL_VERSION-installer-linux-x86_64.sh

# Enable bazel auto completion.
echo "source /usr/local/lib/bazel/bin/bazel-complete.bash" >> ~/.bashrc


# 4.Install CUDA
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


# 5.Install Tensorflow and it's dependencies

# Install Tensorflow using pip
sudo pip install tensorflow

# Install Tensorflow GPU
sudo pip install tensorflow-gpu
