#!/bin/sh
#nvram set ntp_ready=0
mkdir -p /tmp/dnsmasq.dom
logger -t "为防止dnsmasq启动失败，创建/tmp/dnsmasq.dom/"

smartdns_conf="/etc/storage/smartdns_custom.conf"
dnsmasq_Conf="/etc/storage/dnsmasq/dnsmasq.conf"
smartdns_Ini="/etc/storage/smartdns_conf.ini"
sdns_port=$(nvram get sdns_port)
if [ $(nvram get sdns_enable) = 1 ] ; then
logger -t "自动启动" "正在启动SmartDns"
/usr/bin/smartdns.sh start
fi
