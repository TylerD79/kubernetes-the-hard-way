#!/bin/bash
# Update netplan config for network interface
set -e
IPADDR=$2
cat >> /etc/netplan/01-netcfg.yaml <<EOF
network:
  version: 2
  ethernets:
    eth0:
     dhcp4: no
     addresses: [$IPADDR/20]
     gateway4: 172.30.208.1
     nameservers:
       addresses: [8.8.8.8,8.8.4.4]
EOF
netplan apply

set -e
IFNAME=$1
ADDRESS="$(ip -4 addr show $IFNAME | grep "inet" | head -1 |awk '{print $2}' | cut -d/ -f1)"
HOSTNAME=$(hostname)
cat >> /etc/hosts <<EOF
$HOSTNAME $ADDRESS
EOF