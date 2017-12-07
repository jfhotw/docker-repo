#!/bin/sh
# mysql data backup script
#
# use mysqldump --help,get more detail.
#
BakDir=/mydata/dbbak 
LogFile=/mydata/logs/mysqlbak.log
DATE=`date +%Y%m%d%H%M%S`
echo " " >> $LogFile
echo " " >> $LogFile
echo "-------------------------------------------" >> $LogFile 
echo $(date +"%y-%m-%d %H:%M:%S") >> $LogFile 
echo "--------------------------" >> $LogFile 
cd $BakDir
DumpFile=$DATE.sql
GZDumpFile=$DATE.sql.tar.gz
mysqldump -unew_wowodai -predhat -haslave --database  new_wowodai > $DumpFile
echo "mysql Dump Done" >> $LogFile
tar czvf $GZDumpFile $DumpFile >> $LogFile 2>&1 
echo "[$GZDumpFile]Backup Success!" >> $LogFile 
sleep 1
rm -f $DumpFile 
#cd $BakDir/daily
#cd $BakDir   
#echo "Backup Done!" 
#echo "please Check $BakDir Directory!"
#echo "copy it to your local disk or ftp to somewhere !!!"
find $BakDir -ctime +30 -exec rm {} \;
#echo "delete file over 30 days"
