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

############################
#### 1.- google chrome
repo_google_chrome="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
deb_pkg_google_chrome="google-chrome-stable_current_amd64.deb"

wget $repo_google_chrome
apt install ./$deb_pkg_google_chrome
#rm ./$deb_pkg_google_chrome



###########################
#### 2.- sublime
repo_sublime="https://download.sublimetext.com/sublimehq-pub.gpg"

wget -qO - $repo_sublime | sudo apt-key add -
#### stable version
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
#### to https access/download???
sudo apt install apt-transport-https
#### install from repo
sudo apt install sublime-text



###############################
#### NOTE: problems in atom installation..
#### sudo apt --fix-broken install ..... solve the dependencies problem
#### 3.- atom
#repo_atom="https://atom.io/download/deb"
repo_atom="https://packagecloud.io/AtomEditor/atom/gpgkey"
deb_pkg_atom="atom.deb"

#wget $repo_atom -O $deb_pkg_atom
#sudo dpkg -i $deb_pkg_atom

#wget -qO - $repo_atom | sudo apt-key add



###############################
#### 4.- latex and texmaker
sudo apt-get install texlive-base # ...o .... texlive-full ...to a complete version (aprox 3Gb)
sudo apt-get install texmaker # ...to get texmaker editor...



##############################
#### 5.- vivaldi navigator
#URL=https://downloads.vivaldi.com/stable
#wget -q ${URL}/vivaldi-stable_1.11.917.39-1_amd64.deb
#sudo dpkg -i vivaldi-stable_1.11.917.39-1_amd64.deb || \
#  (sudo apt -f install -y && \
#      sudo dpkg -i vivaldi-stable_1.11.917.39-1_amd64.deb)
#rm -f vivaldi-stable_1.11.917.39-1_amd64.deb


#################################
#### 6.- insync
# repo_insync=????
deb_pkg_insync="insync_3.0.25.40643-buster_amd64.deb"
#### ..if we already have the .deb package, is enough with:
#sudo dpkg -i $deb_pkg_insync

#### ...add repo...
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCAF35C
#### ...if before not works use...
#sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys ACCAF35C

#### ...Create a file /etc/apt/sources.list.d/insync.list with the following content:
#### deb http://apt.insync.io/debian buster non-free contrib
sudo echo "deb http://apt.insync.io/debian buster non-free contrib" > /etc/apt/sources.list.d/insync.list
#### ...problems with permission... maybe will need chmod before...

#### ...update and installation...
sudo apt-get update
sudo apt-get install insync




###################################################
DURATION=$SECONDS
echo "`date '+%Y-%m-%d %H:%M:%S'` - INFO - END R INSTALLATION" >> $PATH_FILE_LOG
echo "`date '+%Y-%m-%d %H:%M:%S'` - INFO - FINISH R INSTALLATION IN $(($DURATION / 60)) minutes and $(($DURATION % 60)) seconds" >> $PATH_FILE_LOG
