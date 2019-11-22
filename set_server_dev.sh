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
PATH_CONFIG=$PATH_PROJECT_ROOT/config/config_debian10_main.conf


PATH_PROJECT_LOG=$PATH_PROJECT_ROOT/log


echo $PATH_PROJECT_ROOT
echo $PATH_PROJECT_LOG
echo $PATH_CONFIG

#### TODO: read/parse main_config with execution default variables (paths...)
echo " ------------------- "


local_folder_download=$(awk '/^LOCAL_FOLDER_DOWNLOAD/{print $0}' "${PATH_CONFIG}") #| awk -F. '{print $1}'
echo $local_folder_download

#local_folder_log=$(awk '/^LOCAL_FOLDER_LOG/{print $0}' "${PATH_CONFIG}")


echo $local_folder_download
echo $(pwd)/$local_folder_download

#### TODO: parse args
# --software=name_app ()




DURATION=$SECONDS
echo $DURATION
#date +"[%d/%b/%Y:%k:%M:%S %z]"  >> $PATH_PROJECT_LOG/log.log
#echo "FINISH SET SERVER IN $DURATION seconds." >> $PATH_PROJECT_LOG/log.log
#echo "FINISH SET SERVER IN $(($DURATION / 60)) minutes and $(($DURATION % 60)) seconds." >> $PATH_PROJECT_LOG/log.log
