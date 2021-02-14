#!/bin/bash
inotifywait -rm -e create,modify /etc/wireguard |
    while read path action file; do
        nginx -s quit
        sleep 15
        nginx -s stop
    done