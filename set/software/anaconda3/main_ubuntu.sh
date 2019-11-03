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
PATH_CONFIG=$PATH_PROJECT_ROOT/config/software/anaconda3
PATH_DOWNLOAD=$PATH_PROJECT_ROOT/download

####
#### DEFINE SPECIFIC FILES
PATH_FILE_LOG=$PATH_LOG/log_anaconda3.log
PATH_FILE_CONFIG=$PATH_CONFIG/config


echo "`date '+%Y-%m-%d %H:%M:%S'` - INFO - START ANACONDA INSTALLATION" > $PATH_FILE_LOG
echo "`date '+%Y-%m-%d %H:%M:%S'` - INFO - PATH PROJECT ROOT: $PATH_PROJECT_ROOT" >> $PATH_FILE_LOG
echo "`date '+%Y-%m-%d %H:%M:%S'` - INFO - PATH SET SOFTWARE R ROOT: $PATH_THIS_SET_SOFTWARE_ROOT" >> $PATH_FILE_LOG
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
#### 1.- search last version in https://www.anaconda.com/distribution/
anaconda_sh="https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh"
anaconda_installer="Anaconda3-2019.10-Linux-x86_64.sh"

#### 2.- download sh
cd $PATH_DOWNLOAD

echo `pwd`

echo `curl -O $anaconda_sh`

#### 3.- we verify the installer
echo `sha256sum $anaconda_installer`

#### 4.- execute bash
bash $anaconda_installer
#### ...accept licence and define installation folder...

#### 5. add anaconda path in $PATH variable
# - we can append anaconda ./bin folder in PATH editing /etc/environment
# - we can put export in .bashrc



###################################################
DURATION=$SECONDS
echo "`date '+%Y-%m-%d %H:%M:%S'` - INFO - END anaconda3 INSTALLATION" >> $PATH_FILE_LOG
echo "`date '+%Y-%m-%d %H:%M:%S'` - INFO - FINISH anaconda3 INSTALLATION IN $(($DURATION / 60)) minutes and $(($DURATION % 60)) seconds" >> $PATH_FILE_LOG

