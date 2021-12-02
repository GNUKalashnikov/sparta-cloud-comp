#!/bin/bash
# A Bunch of ubuntu based commands for a quick set up

# Initial setup
sudo apt-get update -y
sudo apt-get upgrade -y

# Specific install of nodejs
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs -y

# Dependencies
sudo apt-get install git -y
sudo apt-get install python-software-properties

# install pm2
sudo mpm instoall pm2 -g

# setting DB
echo "export DB_HOST=DB_HOST="mongodb://TheMcIp:27017/posts >> ~/.bashrc
