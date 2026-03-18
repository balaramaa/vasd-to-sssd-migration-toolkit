#!/bin/bash

echo "Stopping VASD..."
/opt/quest/bin/vastool stop

echo "Uninstalling VASD..."
rpm -e vasclnt

echo "Installing SSSD..."
yum install -y sssd

echo "Configuring SSSD..."
cp sssd.conf /etc/sssd/sssd.conf
chmod 600 /etc/sssd/sssd.conf

echo "Starting SSSD..."
systemctl enable sssd
systemctl start sssd
