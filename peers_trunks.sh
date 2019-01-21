#!/bin/bash

if [ "x$(id -u)" != 'x0' ]; then
    echo 'Error: this script can only be executed by root'
    exit 1
fi

function show_peers {
total=`asterisk -rx 'sip show peers' | grep -f /etc/zabbix/scripts/asterisk_peers_list.txt | wc -l`
active=`asterisk -rx 'sip show peers' | grep -f /etc/zabbix/scripts/asterisk_peers_list.txt | sed -n '/OK/p' | wc -l`
offline=`asterisk -rx 'sip show peers' | grep -f /etc/zabbix/scripts/asterisk_peers_list.txt | sed -n '/UNKNOWN\|UNREACHABLE/p' | awk '{print $1}'`
divide peers
}

function show_trunks {
total=`asterisk -rx 'sip show registry' | sed -n '/registrations/p' | awk '{print $1}'`
active=`asterisk -rx 'sip show registry' | sed -n '/Registered/p' | wc -l`
offline=`asterisk -rx 'sip show registry' | sed -n '/Request\|Rejected\|Authentication\|Auth/p' | awk '{print $1}'`
divide trunks
}

function divide () {
if [ $active -lt $total ]
then
echo $1 offline $offline
else
echo All $1 are online
fi
}

case "$1" in
    peers) show_peers ;;
    trunks) show_trunks ;;
esac

