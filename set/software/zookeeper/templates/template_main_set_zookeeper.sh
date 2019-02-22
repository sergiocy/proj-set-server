#!/bin/bash

echo '...desde el set_main_zookeeper...' 

#### define paths
PATH_PROJECT_ROOT=SED_PATH_PROJECT_ROOT
PATH_LINUX_ROOT=SED_PATH_LINUX_ROOT

PATH_LINUX_ZOOKEEPER_HOME=$PATH_LINUX_ROOT/zookeeper
PATH_PROJECT_ZOOKEEPER_FOLDER=$PATH_PROJECT_ROOT/zookeeper
PATH_PROJECT_ZOOKEEPER_CONFIG=$PATH_PROJECT_ROOT/config
PATH_DOWNLOAD_ZOOKEEPER=$PATH_PROJECT_ROOT/downloads/zookeeper/zookeeper-3.4.13.tar.gz

#### uncompress zookeeper download in /opt/zookeeper
#cd /opt
#tar xvf $PATH_DOWNLOAD_ZOOKEEPER
#mv ./zookeeper-3.4.13 ./zookeeper


####
#### WARNING!! installation not finished
#### it must be copied /zookeeper folder in all nodes in cluster





