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
PATH_CONFIG=$PATH_PROJECT_ROOT/config/software/r

####
#### DEFINE SPECIFIC FILES
PATH_FILE_LOG=$PATH_LOG/log_r.log
PATH_FILE_CONFIG=$PATH_CONFIG/config


echo "`date '+%Y-%m-%d %H:%M:%S'` - INFO - START R INSTALLATION" > $PATH_FILE_LOG
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
#### INSTALLING desktop utils

####
#### 1.- google chrome
repo_google_chrome="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
deb_pkg_google_chrome="google-chrome-stable_current_amd64.deb"

wget $repo_google_chrome
apt install ./$deb_pkg_google_chrome
#rm ./$deb_pkg_google_chrome


####
#### 2.- sublime
repo_sublime="https://download.sublimetext.com/sublimehq-pub.gpg"

wget -qO - $repo_sublime | sudo apt-key add -
#### stable version
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
#### to https access/download???
sudo apt install apt-transport-https
#### install from repo
sudo apt install sublime-text


####
#### NOTE: problems in atom installation..    
#### sudo apt --fix-broken install ..... solve the dependencies problem
#### 3.- atom
#repo_atom="https://atom.io/download/deb"
repo_atom="https://packagecloud.io/AtomEditor/atom/gpgkey"
deb_pkg_atom="atom.deb"

#wget $repo_atom -O $deb_pkg_atom
#sudo dpkg -i $deb_pkg_atom

#wget -qO - $repo_atom | sudo apt-key add 


###################################################
DURATION=$SECONDS
echo "`date '+%Y-%m-%d %H:%M:%S'` - INFO - END R INSTALLATION" >> $PATH_FILE_LOG
echo "`date '+%Y-%m-%d %H:%M:%S'` - INFO - FINISH R INSTALLATION IN $(($DURATION / 60)) minutes and $(($DURATION % 60)) seconds" >> $PATH_FILE_LOG

