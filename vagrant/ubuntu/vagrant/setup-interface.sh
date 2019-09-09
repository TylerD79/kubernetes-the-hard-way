#!/bin/bash
# Update netplan config for network interface
set -e
IPADDR=$1
cat > /etc/netplan/01-netcfg.yaml <<EOF
network:
  version: 2
  ethernets:
    eth0:
     dhcp4: no
     addresses: [$IPADDR/20]
     gateway4: 172.20.176.1
     nameservers:
       addresses: [8.8.8.8,8.8.4.4]
EOF
netplan apply