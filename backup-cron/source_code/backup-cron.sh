#! /bin/bash

targetDir=~/Documents/test
backupd=~/Desktop
maxBackNums=3


function checkfirstBackup()
{
#Copy the current state of the target
ls -l $targetDir > dir-info.last #constant of the original test file
newestDir=$(ls -t | grep ^20| head -1)

ls -l $backupd/backupdir/$newestDir > dir-info.new
# if different make a new copy from target
cmp -s dir-info.last dir-info.new
if [ $? -eq 1 ]
then
	dirDate=$(date '+%Y-%m-%d-%H-%M-%S')
	mkdir -p $dirDate
	cd $dirDate
	cp -a $targetDir/* .

fi
}


function checkDirsNum()
{
numberOfCurrentFiles=$(ls -l | grep ^d | wc -l)
if [ $numberOfCurrentFiles -gt $maxBackNums ]
then
	rm -R $(ls -lt | grep ^d | tr " " "\n" | tail -1 )
fi
}

cd $backupd
if ! [ -d backupdir ] 
then
	mkdir -p backupdir
else 
	echo "Directory exists"
fi

cd $backupd/backupdir
checkfirstBackup

#Check fot the directories number
cd $backupd/backupdir 	
checkDirsNum

ls -l $targetDir > dir-info.last #constant of the original test file
newestDir=$(ls -t | grep ^20| head -1)
ls -l $newestDir > dir-info.new #content of the last modified dir


# if different make a new copy from target
cmp -s dir-info.last dir-info.new
if [ $? -eq 1 ]
then

	dirDate=$(date '+%Y-%m-%d-%H-%M-%S')
	mkdir -p $dirDate
	cd $dirDate
	cp -a $targetDir/* .
fi
#rm dir-info.last
#rm dir-info.new
cd $backupd/backupdir 
#Check fot the directories number
checkDirsNum
