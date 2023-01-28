#!/bin/bash

#등록된 디스크 목록 확인
DEVICES=(`lsblk -s -d -o name,type | grep disk | awk '{print $1}'`)

for DEVICE_NAME in ${DEVICES[@]}
do
   MOUNT_DIR=/mnt/$DEVICE_NAME
   FS_TYPE=ext4

   #마운트 대상 디렉터리 생성
   mkdir -p $MOUNT_DIR

   #빈 디스크 장치에 파티션 생성
   echo -e "n\np\n1\n\n\nw" | fdisk /dev/$DEVICE_NAME
   PART_NAME="/dev/${DEVICE_NAME}1"
   
   #파티션 포맷
   mkfs -t $FS_TYPE $PART_NAME > /dev/null

   #/etc/fstab 파일에 마운트할 디스크 추가
   UUID=`blkid $PART_NAME -o export | grep "^UUID=" | cut -d'=' -f 2`
   echo "UUID=$UUID $MOUNT_DIR $FS_TYPE defaults,nodev,noatime,nofail 1 2" >> /etc/fstab

   #/etc/fstab에 등록된 모든 디스크 마운트
   mount -a
done