. /etc/runit/core-services/lib

log "Mounting psuedo filesystems..."

mnt nosuid,noexec,nodev 	proc 		proc /proc
mnt nosuid,noexec,nodev 	sysfs		sys  /sys
mnt mode=0755,nosuid,nodev  tmpfs   	run  /run
mnt mode=0755,nosuid		devtmpfs	dev  /dev
mkdir -p -m0755 /run/runit /run/lvm /run/user /run/lock /run/log /dev/pts /dev/shm

mnt mode=0620,gid=5,nosuid,noexec devpts devpts /dev/pts
mnt mode=1777,nosuid,nodev		  tmpfs  shm    /dev/shm

{
	ln -s /proc/self/fd /dev/fd
	ln -s fd/0			/dev/stdin
	ln -s fd/1			/dev/stdout
	ln -s fd/2			/dev/stderr
} 2>/dev/null


