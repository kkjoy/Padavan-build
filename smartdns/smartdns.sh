#!/bin/sh
# 精简版 SmartDNS 启动脚本
# 直接使用 /etc/storage/smartdns_custom.conf 作为完整配置
# 仅保留：启停管理 + dnsmasq 转发（硬编码端口 6053）

PORT=6053
CONF="/etc/storage/smartdns_custom.conf"
REDIRECT=$(nvram get snds_redirect)

if [ -x /etc/storage/smartdns ]; then
    BINARY="/etc/storage/smartdns"
elif [ -x /usr/bin/smartdns ]; then
    BINARY="/usr/bin/smartdns"
else
    logger -t "SmartDNS" "ERROR: smartdns binary not found"
    exit 1
fi

change_dns() {
    sed -i '/no-resolv/d' /etc/storage/dnsmasq/dnsmasq.conf
    sed -i '/server=127.0.0.1/d' /etc/storage/dnsmasq/dnsmasq.conf
    echo "no-resolv" >> /etc/storage/dnsmasq/dnsmasq.conf
    echo "server=127.0.0.1#$PORT" >> /etc/storage/dnsmasq/dnsmasq.conf
    /sbin/restart_dhcpd
    logger -t "SmartDNS" "DNS转发到127.0.0.1#$PORT"
}

del_dns() {
    sed -i '/no-resolv/d' /etc/storage/dnsmasq/dnsmasq.conf
    sed -i '/server=127.0.0.1/d' /etc/storage/dnsmasq/dnsmasq.conf
    /sbin/restart_dhcpd
}

start_smartdns() {
    if [ ! -f "$CONF" ]; then
        logger -t "SmartDNS" "ERROR: 配置文件 $CONF 不存在"
        exit 1
    fi
    logger -t "SmartDNS" "启动中，配置文件: $CONF"
    $BINARY -f -c "$CONF" >/dev/null 2>&1 &
    sleep 1
    if pidof smartdns >/dev/null 2>&1; then
        logger -t "SmartDNS" "启动成功 (PID=$(pidof smartdns))"
    else
        logger -t "SmartDNS" "启动失败"
        exit 1
    fi
    if [ "$REDIRECT" = "1" ]; then
        change_dns
    fi
}

stop_smartdns() {
    local pid
    pid=$(pidof smartdns 2>/dev/null)
    if [ -n "$pid" ]; then
        logger -t "SmartDNS" "关闭中 (PID=$pid)..."
        kill $pid 2>/dev/null
        sleep 1
        pid=$(pidof smartdns 2>/dev/null)
        [ -n "$pid" ] && kill -9 $pid 2>/dev/null
    fi
    if [ "$REDIRECT" = "1" ]; then
        del_dns
    fi
    logger -t "SmartDNS" "已关闭"
}

case "$1" in
    start)
        start_smartdns
        ;;
    stop)
        stop_smartdns
        ;;
    restart)
        stop_smartdns
        sleep 1
        start_smartdns
        ;;
    *)
        echo "usage: $0 {start|stop|restart}"
        exit 1
        ;;
esac