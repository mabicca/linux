timestamp=`date`
for i in $(ls /dev/sd*);
do
scsi=`/lib/udev/scsi_id --page=0x83 --whitelisted --device=$i`
echo "$timestamp" >> scsi-ids.txt
echo "device $i | id $scsi" >> scsi-ids.txt
done;
