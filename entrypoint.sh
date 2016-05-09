#!/bin/bash

# generate host keys if not present
ssh-keygen -A

# do not detach (-D), log to stderr (-e), passthrough other arguments
mkdir /var/run/sshd
chmod 0755 /var/run/sshd
exec /usr/sbin/sshd -D -e "$@"
