#!/bin/sh
mkdir -p /etc/ssl
tar -xzf /etc_ro/certs.tgz -C /etc/ssl


if [ ! -f "/etc/storage/smartdns_custom.conf" ] ; then
cp -rf /etc_ro/smartdns_custom.conf /etc/storage/
chmod 755 "/etc/storage/smartdns_custom.conf"
fi
if [ ! -f "/etc/storage/dnsmasq/gfwlist.txt" ] ; then
mkdir -p /etc/storage/dnsmasq/
cp -rf /etc_ro/gfwlist.txt /etc/storage/dnsmasq/gfwlist.txt
chmod 755 "/etc/storage/dnsmasq/gfwlist.txt"
fi
