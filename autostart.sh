#!/bin/sh
#nvram set ntp_ready=0
if [ $(nvram get sdns_enable) = 1 ] ; then
logger -t "自动启动" "正在启动SmartDns"
/usr/bin/smartdns.sh start
fi
