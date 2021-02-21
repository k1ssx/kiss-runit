#!/bin/sh

. /etc/runit/core-services/lib

log "Remounting rootfs as ro..."; {
	mount -o remount,ro / || sos
}

log "Checking filesystems..."; {
	fsck -ATat noopts=_netdev

	[ $? -gt 1 ] && sos
}

log "Mounting roofs as read-write..."; {
	mount -o remount,rw / || sos
}

log "Mounting all local filesystems..."; {
	mount -a || sos
}


log "Enabling swap..."; {
	swapon -a || sos
}





