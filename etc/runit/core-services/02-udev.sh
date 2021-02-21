#!/bin/sh

. /etc/runit/core-services/lib

log "Starting device manager..."
    
if command -v udevd >/dev/null; then
	log "Starting udev..."

    udevd -d
    udevadm trigger -c add -t subsystems
    udevadm trigger -c add -t devices
    udevadm settle

elif command -v mdev >/dev/null; then
    log "Starting mdev..."

    mdev -s
    mdev -df & mdev_pid=$!
fi
