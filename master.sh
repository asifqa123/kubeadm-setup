#!/bin/bash

# Run commands as root
sudo su

# Initialize Kubernetes cluster
kubeadm init

# Set up kubeconfig for regular user
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Alternatively, if you are the root user, you can run:
export KUBECONFIG=/etc/kubernetes/admin.conf

# Deploy Weave networking
kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml

# Print join command token
kubeadm token create --print-join-command