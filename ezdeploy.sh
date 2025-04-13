#!/bin/bash

# EZDeploy Script - For AWS EC2

echo " Checking Docker..."
if ! command -v docker &> /dev/null
then
    echo " Docker not found. Installing..."
    sudo apt update
    sudo apt install docker.io -y
    sudo systemctl start docker
    sudo systemctl enable docker
    echo " Docker installed."
else
    echo " Docker is already installed."
fi

echo " Building Docker image for EZDeploy..."
docker build -t ezdeploy .

echo " Running container on port 80..."
docker run -d -p 80:80 --name ezdeploy-container ezdeploy

echo " Your site is live at http://<your-ec2-ip>"
