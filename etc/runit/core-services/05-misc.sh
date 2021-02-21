#!/bin/sh

. /etc/runit/core-services/lib

log "Setting up loopback..."; {
	ip link set up dev lo
}

log "Setting hostname..."; {
	[ -r /etc/hostname] && read -r HOSTNAME < /etc/hostname
		log "Setting up hostname to '${HOSTNAME:-KISS}'..."
		printf "%s" "${HOSTNAME:-KISS}" > /proc/sys/kernel/hostname
} 2>/dev/null

log "Loading sysctl settings..."; {
	for conf in /run/sysctl.d/*.conf \
				/etc/sysctl.d/*.conf \
				/usr/lib/sysctl.d/*.conf \
				/etc/sysctl.conf; do
		[ -f "$conf" ] || continue

		case $seen in *" ${conf##*/} "*) continue; esac
		seen=" $seen ${conf##*/} "
		sysctl -p "$conf"
	done
}




