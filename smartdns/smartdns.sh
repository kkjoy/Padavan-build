#!/bin/sh

if [ -x /etc/storage/smartdns ]; then
    APP=/etc/storage/smartdns
elif [ -x /usr/bin/smartdns ]; then
    APP=/usr/bin/smartdns
else
    exit 1
fi

CONF=/etc/storage/smartdns_custom.conf
APP_NAME=$(basename "$APP")
NUM=$(pgrep -x "$APP_NAME" 2>/dev/null | wc -l)

if [ "$NUM" -lt "1" ]; then
    $APP -c "$CONF"
elif [ "$NUM" -gt "1" ]; then
    pgrep -x "$APP_NAME" | xargs kill -9 2>/dev/null
    sleep 1
    $APP -c "$CONF"
fi

exit 0
