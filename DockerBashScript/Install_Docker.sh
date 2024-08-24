#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Step 1: Update the package list
echo "Updating the package list..."
sudo apt-get update

# Step 2: Install necessary packages for Docker
echo "Installing necessary packages..."
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Step 3: Add Docker's official GPG key
echo "Adding Docker's official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Step 4: Set up the stable repository
echo "Setting up the Docker repository..."
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Step 5: Update the package list again with Docker's repo
echo "Updating the package list again..."
sudo apt-get update

# Step 6: Install Docker
echo "Installing Docker..."
sudo apt-get install -y docker-ce

# Step 7: Add your user to the docker group
echo "Adding your user to the docker group..."
sudo usermod -aG docker $USER

# Step 8: Enable Docker to start on boot
echo "Enabling Docker to start on boot..."
sudo systemctl enable docker

# Step 9: Start Docker service
echo "Starting Docker service..."
sudo systemctl start docker

# Step 10: Verify Docker installation
echo "Verifying Docker installation..."
docker --version

echo "Docker installation completed successfully!"

# Inform the user to log out and back in
echo "Please log out and log back in to apply the changes to the docker group."
