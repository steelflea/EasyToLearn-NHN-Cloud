#!/bin/bash
# NGINX 설치
apt-get update
apt-get -y install nginx

# index.html 파일 만들기
fileName=/var/www/html/index.html
echo "Running ZION DEFENSE SYSTEM from host $(hostname)">${fileName}
