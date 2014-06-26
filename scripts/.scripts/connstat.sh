#!/bin/bash 
CURRCONN="$(nmcli -t -f name con status)"

if [[ ${#CURRCONN} = 0 ]]; then
    echo N/A 0
else
    nmcli -t -f ssid,signal dev wifi list | grep "'$CURRCONN'" | sort -n -r | head -1 | sed s/\'//g | sed s/\:/\ /g
fi
