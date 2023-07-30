#!/bin/sh
clear
echo "Bắt đầu tiến hành cập nhật & cài đặt những gói dữ liệu cơ bản..."
apk update && apk add nano git bash
clear

echo "Bắt đầu cài đặt python3 và đặt làm mặc định..."
apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
clear

echo "Bắt đầu cài đặt những gói dữ liệu cần thiết..."
apk add --no-cache libgcc libstdc++ build-base cairo-dev jpeg-dev pango-dev freetype-dev giflib-dev gcc g++ make pkgconfig
clear

# Download and install nodejs 16:
echo "N: Bắt đầu cài đặt nodejs sau 10s..."
sleep 10
bash <(curl -Ls https://raw.githubusercontent.com/dragonx943/alpine-node/main/setup.sh)
clear
echo "Đã thực thi cài đặt các gói chương trình cơ bản & cần thiết! Nếu xảy ra lỗi, vui lòng chạy lại trình cài đặt này!"
sleep 5