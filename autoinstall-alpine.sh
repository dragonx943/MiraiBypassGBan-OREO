#!/bin/sh
echo "N: Update packages and install some important packages into your machine..."
apk update && apk add sudo nano git gcc g++ make wget pkgconfig

echo "W: Install latest python3 as default..."
apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python 

echo "W: Install some necessary library and packages..."
apk add --no-cache libgcc libstdc++ build-base cairo-dev jpeg-dev pango-dev freetype-dev giflib-dev

# Detect your architecture into value to download and install nodejs 16:
tarball="node-v16.15.1-linux-*-alpine.tar.gz"
if [ ! -f $tarball ]; then
                echo "W: Download Nodejs v16, this may take a while base on your internet speed."
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
                echo "W: Installing nodejs & npm..."
                tar -xzf node-v16.15.1-linux-${archurl}-alpine.tar.gz -C /usr --strip-components=1 --no-same-owner
                echo "W: Cleaning up..."
                rm -rf node-v16.15.1-linux-*-alpine.tar.gz
                echo "N: Successful installation important packages!"
fi
echo "W: Clone bot repo from Github..."
cd ~
git clone https://github.com/dragonx943/MiraiBypassGBan
cd MiraiBypassGBan
npm i
echo "Create your fbstate.json and type "node ." to start your bot!"