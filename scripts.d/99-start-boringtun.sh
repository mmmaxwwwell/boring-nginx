#!/bin/bash
boringtun --disable-drop-privileges getLogin `ip addr | grep -oP "(eth\d*@if\d*)"`
ls -1 /etc/wireguard | tr -d '.conf' | xargs -n1 wg-quick up
/scripts/restart-nginx-on-wireguard.sh &