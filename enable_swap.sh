#!/bin/sh
echo "Checking working swap partitions"
for i in $(grep -e "sd[a-z][0-9]" -e "hd[a-z][0-9]" /proc/partitions | awk '{ print $4 }'); do
	 if [ "$(blkid /dev/$i | awk '{ print $3 }')" == "TYPE=\"swap\"" ]; then
	 	swapon /dev/$i 
	 fi
done


