#!/bin/bash

####
#### START EXECUTION
SECONDS=0
CURRENT_DATE=$(date +%Y-%m-%d)
#CURRENT_TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
CURRENT_TIMESTAMP=`date '+%Y-%m-%d %H:%M:%S'`


####
#### PROJECT AND INSTALLATION FOLDERS
PATH_PROJECT_ROOT=$(pwd)
PATH_PROJECT_CONFIG==$PATH_PROJECT_ROOT/config
PATH_PROJECT_LOG=$PATH_PROJECT_ROOT/log
PATH_CONFIG_MAIN=$PATH_PROJECT_CONFIG/config_debian10_main.conf
#### read config in ./config/config_debian10_main.conf
PATH_PROJECT_DOWNLOAD=$(awk '/^LOCAL_FOLDER_DOWNLOAD/{print $0}' "${PATH_CONFIG}" | sed 's/LOCAL_FOLDER_DOWNLOAD=//') 

echo $PATH_PROJECT_ROOT
echo $PATH_PROJECT_CONFIG
echo $PATH_CONFIG_MAIN
echo $PATH_PROJECT_LOG
echo $PATH_PROJECT_DOWNLOAD


#### TODO: parse args
# --software=name_app ()

####
#### VALIDATE EXISTS INPUT ARGUMENTS
if [ $# == 0 ]
then
	echo 'WARNING!!! you must use input arguments'
	echo 'you could use -h or --help argument to know the process'
	exit 1
else
	echo "in else"
fi




DURATION=$SECONDS
echo $DURATION
#date +"[%d/%b/%Y:%k:%M:%S %z]"  >> $PATH_PROJECT_LOG/log.log
#echo "FINISH SET SERVER IN $DURATION seconds." >> $PATH_PROJECT_LOG/log.log
#echo "FINISH SET SERVER IN $(($DURATION / 60)) minutes and $(($DURATION % 60)) seconds." >> $PATH_PROJECT_LOG/log.log
