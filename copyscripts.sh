#!/bin/sh
mkdir -p /etc/ssl
tar -xzf /etc_ro/certs.tgz -C /etc/ssl


if [ ! -f "/etc/storage/smartdns_custom.conf" ] ; then
cp -rf /etc_ro/smartdns_custom.conf /etc/storage/
chmod 755 "/etc/storage/smartdns_custom.conf"
fi
if [ ! -f "/etc/storage/gfwlist.txt" ] ; then
mkdir -p /etc/storage/gfwlist
cp -rf /etc_ro/gfwlist.txt /etc/storage/gfwlist.txt
chmod 755 "/etc/storage/gfwlist/gfwlist_list.conf"
fi
