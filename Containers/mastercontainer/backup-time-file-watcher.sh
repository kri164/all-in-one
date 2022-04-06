#!/bin/bash

restart_process() {
    set -x
    pkill cron.sh
    set +x
}

file_present() {
    if [ -f "/mnt/docker-aio-config/data/daily_backup_time" ]; then
        if [ "$FILE_PRESENT" = 0 ]; then
            restart_process
        fi
        FILE_PRESENT=1
    else
        if [ "$FILE_PRESENT" = 1 ]; then
            restart_process
        fi
        FILE_PRESENT=0
    fi
}

while true; do
    file_present
    sleep 5
done
