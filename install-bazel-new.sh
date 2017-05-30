#!/usr/bin/env bash

"""
1st Method
"""

# Add Bazel distribution URI as a package source
echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
curl https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -

# Install and update Bazel
sudo apt-get update && sudo apt-get install bazel

# To upgrade to a newer version of Bazel
sudo apt-get upgrade bazel

"""
2nd Method
"""

# Select bazel version.
BAZEL_VERSION="0.5.0"

# Install required packages
sudo apt-get install pkg-config zip g++ zlib1g-dev unzip

# Download bazel
mkdir -p /bazel
cd /bazel
if [[ ! -f "bazel-$BAZEL_VERSION-installer-linux-x86_64.sh" ]]; then
  curl -fSsL -O https://github.com/bazelbuild/bazel/releases/download/$BAZEL_VERSION/bazel-$BAZEL_VERSION-installer-linux-x86_64.sh
fi

# Run the installer
chmod +x bazel-$BAZEL_VERSION-installer-linux-x86_64.sh
./bazel-$BAZEL_VERSION-installer-linux-x86_64.sh --user

# Add $HOME/bin directory to your default paths
export PATH="$PATH:$HOME/bin"

# To upgrade to a newer version of Bazel
sudo apt-get upgrade bazel