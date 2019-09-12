#!/bin/bash
set -e
IFNAME=$1
ADDRESS="$(ip -4 addr show $IFNAME | grep "inet" | head -1 |awk '{print $2}' | cut -d/ -f1)"
HOSTNAME=$(hostname)
cat > /etc/hosts <<EOF
$ADDRESS $HOSTNAME
EOF
#sed -e "s/^.*${HOSTNAME}.*/${ADDRESS} ${HOSTNAME} ${HOSTNAME}.local/" -i /etc/hosts

# remove ubuntu-bionic entry
#sed -e '/^.*ubuntu-bionic.*/d' -i /etc/hosts

# Update /etc/hosts about other hosts
#cat >> /etc/hosts <<EOF
#172.18.96.11  master-1
#172.18.96.12  master-2
#172.18.96.21  worker-1
#172.18.96.22  worker-2
#172.18.96.30  lb
#EOF
