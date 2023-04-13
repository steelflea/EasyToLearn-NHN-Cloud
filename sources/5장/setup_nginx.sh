#!/bin/bash
# NGINX 설치
apt-get update
apt-get -y install nginx

# index.html 파일 만들기
echo "Running ZION DEFENSE SYSTEM from host $(hostname)" > /var/www/html/index.html
