#!/bin/sh
# info: Install script
# version: v1.0.0
#
# Copyright (c) 2016 Vasilyuk Vasiliy <vasilyuk.vasiliy@gmail.com>

CONFIG_PATH="/root/.megarc"

sudo su # login on root

cp ./v-sync-backups-to-mega.sh /usr/local/vesta/bin/v-sync-backups-to-mega
chmod 770 /usr/local/vesta/bin/v-sync-backups-to-mega
chown root:root /usr/local/vesta/bin/v-sync-backups-to-mega
cp .megarc /root/


echo "Enter email of Mega account: "
read email
echo "Password of Mega account: "
read pass

echo "[Login]"
echo "Username = ${email}"
echo "Password = ${pass}"
echo -n "Write to config file ${CONFIG_PATH}? (y/n) "

read item
case "$item" in
    y|Y) echo "You enter «y», saved..."
        echo "[Login]" > ${CONFIG_PATH}
        echo "Username = ${email}" >> ${CONFIG_PATH}
        echo "Password = ${pass}" >> ${CONFIG_PATH}
        ;;
    n|N) echo "You enter «n», settings not saved..."
        exit 0
        ;;
    *) echo "Stoped..."
        exit 0
        ;;
esac