#!/bin/sh
## This commands for linux have "apt" like Ubuntu or Debian or something else...NEED ROOT

## Add packages and library
echo "Start install important packages and library...Please login as root user before install this bot!"
echo "WARNING: Not logging in as root will cause an error!"
apt update && apt install git nano wget python3 python-is-python3 gcc g++ make build-essential libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev librsvg2-dev -y --auto-remove
clear

## Install nodejs 16
echo "Starting install nodejs 16...If its stuck, please restart the main commands!"
cd ~
curl -sL https://deb.nodesource.com/setup_16.x | sudo bash -
sudo apt install nodejs -y
clear

## Clone bot repo
echo "Clone bot repo..."
cd ~
git clone https://github.com/dragonx943/MiraiBypassGBan
cd ~/MiraiBypassGban
clear

## Install modules (Requires internet)
echo "Start install important modules for bot...If the commmand error, type "npm install" to try again!"
npm install
clear

## Add fbstate.json
echo "Now, import your fbstate.json and launch it...Start editor after 10 seconds, press "Ctrl + C" to cancel!"
sleep 10
nano fbstate.json
clear
echo "Launch your bot: Type "node ." to start and press Ctrl + C to stop!"
echo "Add your commands to "MiraiBypassGBan/modules/commands" and your events to "MiraiBypassGban/events""
sleep 5