#!/bin/bash
## This commands for linux have "apt" like Ubuntu or Debian or something else...NEED ROOT

## Some crazy note
clear
echo "Lưu ý: Trình cài đặt này dành cho hệ điều hành Ubuntu, Debian...Hãy đăng nhập dưới quyền Root trước khi cài đặt!"
sleep 5
clear
echo "CẢNH BÁO: Không đăng nhập dưới quyền Root có thể gây ra lỗi trong quá trình cài đặt!"
sleep 5
clear

## Install some important packages from repo archive
echo "N: Bắt đầu cập nhật các gói dữ liệu từ máy chủ của hệ điều hành..."
apt update && apt upgrade -y
clear
echo "W: Bắt đầu cài đặt các gói cần thiết cho hệ điều hành..."
apt install sudo git nano wget python3 python-is-python3 gcc g++ make build-essential libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev librsvg2-dev -y --auto-remove
clear

## Install nodejs 16
echo "N: Bắt đầu cài đặt nodejs v16...Nếu trình cài đặt bị đứng ở đây, vui lòng khởi động lại trình cài đặt gốc!"
cd ~
curl -sL https://deb.nodesource.com/setup_16.x | sudo bash -
sudo apt install nodejs -y
clear
