#!/usr/bin/env bash
source ~/.Xdbus

while pkill --signal 0 offlineimap
do
    sleep 2
done

offlineimap -u quiet >> ~/mail-log 2>&1
