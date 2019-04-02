#!/bin/bash
if [ ! -d /var/lib/cassandra ]
then
    mkdir /var/lib/cassandra
    mkfs.ext4 -F /dev/nvme0n1
    mount -o discard,defaults /dev/nvme0n1 /var/lib/cassandra
    echo '/dev/nvme0n1 /var/lib/cassandra ext4 defaults 1 1' >> /etc/fstab
fi