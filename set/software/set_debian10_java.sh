#!/bin/bash


#### START EXECUTION
SECONDS=0
CURRENT_DATE=$(date +%Y-%m-%d)
CURRENT_TIMESTAMP=`date '+%Y-%m-%d %H:%M:%S'`

###################################################
#### PROJECT AND INSTALLATION FOLDERS
PATH_THIS_SET_SOFTWARE_ROOT=$(pwd)
PATH_PROJECT_ROOT=$(cd ../../..; pwd)
PATH_LOG=$PATH_PROJECT_ROOT/log
PATH_CONFIG=$PATH_PROJECT_ROOT/config/software/java

####
#### DEFINE SPECIFIC FILES
PATH_FILE_LOG=$PATH_LOG/log_r.log
PATH_FILE_CONFIG=$PATH_CONFIG/config


echo "`date '+%Y-%m-%d %H:%M:%S'` - INFO - START INSTALLATION" > $PATH_FILE_LOG
echo "`date '+%Y-%m-%d %H:%M:%S'` - INFO - PATH PROJECT ROOT: $PATH_PROJECT_ROOT" >> $PATH_FILE_LOG
echo "`date '+%Y-%m-%d %H:%M:%S'` - INFO - PATH SET SOFTWARE ROOT: $PATH_THIS_SET_SOFTWARE_ROOT" >> $PATH_FILE_LOG
echo "`date '+%Y-%m-%d %H:%M:%S'` - INFO - PATH LOG: $PATH_LOG" >> $PATH_FILE_LOG
echo "`date '+%Y-%m-%d %H:%M:%S'` - INFO - PATH CONFIG: $PATH_CONFIG" >> $PATH_FILE_LOG


###################################################
#### LOADING RESOURCES
#source $PATH_PROJECT_ROOT/service/functions_util.sh 
#source $PATH_PROJECT_ROOT/service/controller_help.sh 
#source $PATH_PROJECT_ROOT/service/controller_set_software.sh
#source $PATH_PROJECT_ROOT/service/controller_validations.sh



###################################################
#### INSTALLING

sudo apt-get update

sudo apt-get install default-jre

sudo apt-get install default-jdk

#### set JAVA_HOME VARIABLE

# sudo update-alternatives --config java
#### ...and we must get java-path in output...

# and add "JAVA_HOME=xxxx" in the top of /etc/environment file

###################################################
DURATION=$SECONDS
echo "`date '+%Y-%m-%d %H:%M:%S'` - INFO - END INSTALLATION" >> $PATH_FILE_LOG
echo "`date '+%Y-%m-%d %H:%M:%S'` - INFO - FINISH INSTALLATION IN $(($DURATION / 60)) minutes and $(($DURATION % 60)) seconds" >> $PATH_FILE_LOG

