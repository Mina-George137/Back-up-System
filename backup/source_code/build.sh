#! /bin/bash

backDir=$1
cd $backDir
if ! [ -d backupdir ] 
then
	mkdir -p backupdir
else 
	echo "Directory exists"
fi
