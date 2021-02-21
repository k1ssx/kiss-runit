#!/bin/sh

. /etc/runit/core-services/lib


log "Killing device manager to make way for service..."; {
#	if command -v udevd >/dev/null; then
#		udevadm control --exit

}
