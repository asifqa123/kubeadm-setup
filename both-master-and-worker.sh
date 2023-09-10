#!/bin/bash

# Update package list and install Docker
sudo apt update -y
sudo apt install docker.io -y

# Start Docker service and enable it to start on boot
sudo systemctl start docker
sudo systemctl enable docker

# Add Kubernetes repository and install Kubernetes tools
curl -fsSL "https://packages.cloud.google.com/apt/doc/apt-key.gpg" | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/kubernetes-archive-keyring.gpg
echo 'deb https://packages.cloud.google.com/apt kubernetes-xenial main' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update -y
sudo apt install kubeadm=1.20.0-00 kubectl=1.20.0-00 kubelet=1.20.0-00 -y
