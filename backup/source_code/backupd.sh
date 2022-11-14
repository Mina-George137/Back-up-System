#! /bin/bash

function checkfirstBackup()
{
#Copy the current state of the target
ls -l $currentDir > dir-info.last #constant of the original test file
newestDir=$(ls -t | grep ^20| head -1)
ls -l $backupd/backupdir/$newestDir > dir-info.new
# if different make a new copy from target
cmp -s dir-info.last dir-info.new
if [ $? -eq 1 ]
then
	dirDate=$(date '+%Y-%m-%d-%H-%M-%S')
	mkdir -p $dirDate
	cd $dirDate
	cp -a $currentDir/* .

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

currentDir=$1
backupd=$2
sec=$3
maxBackNums=$4

cd $backupd/backupdir
checkfirstBackup

#Check fot the directories number
cd $backupd/backupdir 	
checkDirsNum
	
while [ 1 ]
do
	sleep $sec
	ls -l $currentDir > dir-info.last #constant of the original test file
	ls -l $dirDate > dir-info.new
	
	# if different make a new copy from target
	cmp -s dir-info.last dir-info.new
	if [ $? -eq 1 ]
	then

		dirDate=$(date '+%Y-%m-%d-%H-%M-%S')
		mkdir -p $dirDate
		cd $dirDate
		cp -a $currentDir/* .
	fi
	
	cd $backupd/backupdir 
	#Check fot the directories number
	checkDirsNum
	
done

