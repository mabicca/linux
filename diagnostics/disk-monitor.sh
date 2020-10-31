#!/bin/bash
# Still in testing and evaluation
_interval=0.025
_previousReads=0
_previousWrites=0
_currentReads=0
_currentWrites=0
_device=md127
_date=`date +"%Y-%m-%d %H:%M:%S:%N"`
 
while :
do
        _data=`cat /proc/diskstats | grep -i $_device`
        _device=`echo $_data | awk '{print $3}'`
        _currentReads=`echo $_data | awk '{print $4}'`
        _currentWrites=`echo $_data | awk '{print $8}'`
        _reads=$(($_currentReads - $_previousReads))
        _writes=$(($_currentWrites - $_previousWrites))
echo "$_date | $_device | READS: $_reads | WRITES: $_writes" >> ms_diskstats.log
#sleep 0.025
sleep $_interval
_previousReads=$_currentReads
_previousWrites=$_currentWrites 
done
