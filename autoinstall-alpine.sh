#!/bin/sh
clear
echo "Bắt đầu tiến hành cập nhật & cài đặt những gói dữ liệu cơ bản..."
apk update && apk add sudo nano git gcc g++ make wget pkgconfig
clear

echo "Bắt đầu cài đặt python3 và đặt làm mặc định..."
apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
clear

echo "Bắt đầu cài đặt những gói dữ liệu cần thiết..."
apk add --no-cache libgcc libstdc++ build-base cairo-dev jpeg-dev pango-dev freetype-dev giflib-dev
clear

# Detect your architecture into value to download and install nodejs 16:
tarball="node-v16.15.1-linux-*-alpine.tar.gz"
if [ ! -f $tarball ]; then
                echo "Đang tải Nodejs v16, có thể mất một lúc dựa vào đường truyền kết nối mạng của bạn..."
                case `uname -m` in
                i386)
                        archurl="x86" ;;
                i686)
                        archurl="x86" ;;
                x86)
                        archurl="x86" ;;
                aarch64)
                        archurl="arm64" ;;
                arm)
                        archurl="arm" ;;
                amd64)
                        archurl="x86_64" ;;
                x86_64)
                        archurl="x86_64" ;;
                esac
                curl -fLO https://github.com/dragonx943/alpine-node/releases/download/v16.15.1/node-v16.15.1-linux-${archurl}-alpine.tar.gz
                echo "W: Đang cài đặt nodejs & npm..."
                tar -xzf node-v16.15.1-linux-${archurl}-alpine.tar.gz -C /usr --strip-components=1 --no-same-owner
                echo "W: Đang dọn dẹp..."
                rm -rf node-v16.15.1-linux-*-alpine.tar.gz
fi
clear
echo "Đã thực thi cài đặt các gói chương trình cơ bản & cần thiết! Nếu xảy ra lỗi, vui lòng chạy lại trình cài đặt này!"
sleep 5