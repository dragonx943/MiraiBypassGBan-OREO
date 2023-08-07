#!/bin/bash
## Clear screen and prepare to install
clear
echo "Trình cài đặt sẽ được bắt đầu sau 10s...Nhấn "Ctrl + C" để hủy cài đặt bất cứ lúc nào, kể cả khi có bất thường trong quá trình cài đặt"
sleep 3
echo "Lưu ý: Vui lòng ấn "Cho phép" nếu Termux yêu cầu quyền được truy cập bộ nhớ. Hãy giữ kết nối Internet luôn được ổn định !!!"
sleep 7
clear

## Replace Termux's repo files
termux-setup-storage
sleep 10
echo "Tiến trình: Đang thay thế các tệp hệ thống của Termux..."
rm -rf /data/data/com.termux/files/usr/etc/apt/sources.list.d
rm -rf /data/data/com.termux/files/usr/etc/apt/sources.list
echo "deb https://packages.termux.dev/apt/termux-main/ stable main" >> /data/data/com.termux/files/usr/etc/apt/sources.list

## Start install linux distro for Termux
echo "Tiến trình: Bắt đầu quá trình cập nhật gói sau khi thay đổi dữ liệu..."
apt update && apt upgrade -y
clear
echo "Tiến trình: Bắt đầu quá trình cài đặt hệ điều hành Ubuntu..."
apt install proot-distro -y
proot-distro install ubuntu
sleep 5

## Create file run Ubuntu on Termux
clear
echo "Tiến trình: Đang khởi tạo lối tắt truy cập hệ điều hành Ubuntu..."
echo "proot-distro login ubuntu" >> /data/data/com.termux/files/usr/bin/ubuntu
chmod a+x /data/data/com.termux/files/usr/bin/ubuntu
sleep 5

## Start setup important packages for Ubuntu
clear
echo "Tiến trình: Bắt đầu cài đặt các gói cần thiết cho Ubuntu. Ubuntu sẽ được khởi động sau 10s..."
sleep 10
proot-distro login ubuntu -- bash <(curl -Ls https://raw.githubusercontent.com/dragonx943/MiraiBypassGBan-OREO/main/autoinstall-linux.sh)
sleep 10
clear

## Some crazy notepad
echo "Đã thực thi cài đặt xong. Nhập "ubuntu" để đăng nhập và sử dụng hệ điều hành Ubuntu với quyền Root!"
