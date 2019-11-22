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

# 1.- TODO ....variables to get from config...
hadoop_path_download=https://www.apache.org/dist/hadoop/core/hadoop-2.8.5/
hadoop_targz_download=hadoop-2.8.5.tar.gz
folder_local_installation=/opt/hadoop

hadoop_repo_download=$hadoop_path_download$hadoop_targz_download


####
#### NOTE!!! a lot of resources create and manage from a new user "hadoop"
####

#### 2.- download hadoop tar.gz from apache repositories
cd $PATH_DOWNLOAD

echo `pwd`

wget $hadoop_repo_download

#### 3.- we verify the installer and unzip
#echo `sha256sum $hadoop_repo_download`
# ...or shasum -a 512 hadoop_file_tar.gz

tar -zxvf hadoop-2.8.5.tar.gz -C $folder_local_installation

#### ...in this way we must an installation in /opt/hadoop/hadoop-2.8.5/*.... we must pùt the content in /opt/hadoop .... to friendly...


#### 4.- put environment variables in bashrc
#export HADOOP_HOME=/opt/hadoop
#export HADOOP_INSTALL=$HADOOP_HOME
#export HADOOP_MAPRED_HOME=$HADOOP_HOME
#export HADOOP_COMMON_HOME=$HADOOP_HOME
#export HADOOP_HDFS_HOME=$HADOOP_HOME
#export HADOOP_YARN_HOME=$HADOOP_HOME
#export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
#export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin


#### 5.- editing core-site.xml
# ...we can use the template (proj-set-server/templates/hadoop) to parametrize in a dynamic way...
# ...put proj-set-server/config/software/hadoop/core-site.xml -> $folder_local_installation/etc/hadoop/core-site.xml


#### 6.- editing hdfs-site.xml
# ...we can use the template (proj-set-server/templates/hadoop) to parametrize in a dynamic way...
# ...put proj-set-server/config/software/hadoop/hdfs-site.xml -> $folder_local_installation/etc/hadoop/hdfs-site.xml


#### 7.- prepare hadoop... create and prepare namenode and datanode folders (defined in hdfs-site.xml)
# hadoop namenode -format


#### 8.- change ssh port in hadoop configuration
# ...add the next line in $folder_local_installation/etc/hadoop/hadoop-env.sh
# export HADOOP_SSH_OPTS="-p <num>"



###################################################
DURATION=$SECONDS
echo "`date '+%Y-%m-%d %H:%M:%S'` - INFO - END INSTALLATION" >> $PATH_FILE_LOG
echo "`date '+%Y-%m-%d %H:%M:%S'` - INFO - FINISH INSTALLATION IN $(($DURATION / 60)) minutes and $(($DURATION % 60)) seconds" >> $PATH_FILE_LOG

