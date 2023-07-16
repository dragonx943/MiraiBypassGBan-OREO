#!/bin/sh
echo "N: Update packages and install some important packages into your machine..."
apk update && apk add sudo nano git python3 gcc g++ make wget pkgconfig

echo "W: Install python3 as default..."
apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python 

echo "W: Install necessary library and packages..."
apk add --no-cache libgcc libstdc++ build-base cairo-dev jpeg-dev pango-dev freetype-dev giflib-dev

# Detect your architecture into value to download and install nodejs 16:
tarball="node-v16.15.1-linux-*-alpine.tar.gz"
if [ ! -f $tarball ]; then
                echo "W: Download Nodejs v16, this may take a while base on your internet speed."
                case `uname -m` in
                aarch64)
                        archurl="arm64" ;;
                arm)
                        archurl="arm" ;;
                amd64)
                        archurl="x86_64" ;;
                x86_64)
                        archurl="x86_64" ;;
                esac
                curl -fLO https://github.com/oznu/alpine-node/releases/download/16.15.1/node-v16.15.1-linux-${archurl}-alpine.tar.gz
                echo "W: Installing nodejs & npm..."
                tar -xzf node-v16.15.1-linux-{your arch}-alpine.tar.gz -C /usr --strip-components=1 --no-same-owner
                echo "W: Cleaning up..."
                rm -rf node-v16.15.1-linux-*-alpine.tar.gz
                echo "W: Successful installation."
fi
echo "W: Not detected your Architecture, stoping executive command..."
echo "E: Install packages failed !!!"