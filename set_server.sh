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
PATH_PROJECT_LOG=$PATH_PROJECT_ROOT/log

echo 'START SET SERVER' > $PATH_PROJECT_LOG/log.log
echo "`date '+%Y-%m-%d %H:%M:%S'` - INFO - start execution" >> $PATH_PROJECT_LOG/log.log
echo "`date '+%Y-%m-%d %H:%M:%S'` - INFO - project folder: $PATH_PROJECT_ROOT" >> $PATH_PROJECT_LOG/log.log
echo "`date '+%Y-%m-%d %H:%M:%S'` - INFO - project log folder: $PATH_PROJECT_LOG" >> $PATH_PROJECT_LOG/log.log


####
#### LOADING RESOURCES
source $PATH_PROJECT_ROOT/scripts/functions_util.sh 
source $PATH_PROJECT_ROOT/scripts/controller_help.sh 
source $PATH_PROJECT_ROOT/scripts/controller_set_software.sh
source $PATH_PROJECT_ROOT/scripts/controller_validations.sh



####
#### VALIDATE EXISTS INPUT ARGUMENTS
if [ $# == 0 ]
then
	echo 'WARNING!!! you must use input arguments'
	echo 'you could use -h or --help argument to know the process'
	exit 1
fi



####
#### GET INPUT ARGUMENTS
declare -a array_args_input
declare -a array_values_input

for iter in $@
do
	arg_set=$1
	value_set=$2
	#array_args_input=( "${array_args_input[@]}" "$arg_set" )
	array_args_input+=( $1 )
	array_values_input+=( $2 )


	case $arg_set in

		--software)
			echo 'option software'
			
			#### control if value is valid
			#list_software=( hadoop hive spark )
			#value_exists_in_list $value_set $list_software
			#ctrl=$?
			#echo $ctrl

			#if [ $ctrl == 1 ]
			#then
			#	SOFTWARE_SELECTED=$value_set
			#	echo 'DENTRO IF'
			#else
			#	echo 'value not exits'
			#	info_software_available
			#	exit 0
			#	echo 'otra cosa'
			#fi
			;;

		--software-opt)
			echo 'maybe an array to set more additional options for software option'
			;;

		--data)
			echo 'option data'
			;;

		--data-opt)
			echo 'maybe an array to set more additional options for data option'
			;;

		--dir)
			echo 'option install dir'
			#PATH_LINUX_INSTALL_DIR=value_set
			#SED_PATH_LINUX_ROOT='\/opt'
			#echo $PATH_LINUX_INSTALL_DIR
			echo 'folder for installation in software option and hdfs (s3) path in data option'
			;;

		--help)
			echo 'APP to set software in linux machine...'
			info_software_available
			info_args
			;;
	esac

	shift 2
done


#echo ${array_args_input[@]} 
#echo ${array_values_input[@]} 
echo "`date '+%Y-%m-%d %H:%M:%S'` - INFO - parsed args: ${array_args_input[@]}" >> $PATH_PROJECT_LOG/log.log
echo "`date '+%Y-%m-%d %H:%M:%S'` - INFO - parsed values: ${array_values_input[@]}" >> $PATH_PROJECT_LOG/log.log

#sleep 3


####
#### ARGUMENTS INPUT VALIDATIONS
validate_data_or_software ${array_args_input[@]}
opt_data_and_software=$?
echo $opt_data_and_software
echo 'de vuelta al main'


DURATION=$SECONDS
#echo -ne '*** END ANOMALY DETECTION WORKFLOW - ' >> $PATH_LOG_FILE/log_file_job_detection.log; 
date +"[%d/%b/%Y:%k:%M:%S %z]"  >> $PATH_PROJECT_LOG/log.log
echo "FINISH SET SERVER IN $DURATION seconds." >> $PATH_PROJECT_LOG/log.log
echo "FINISH SET SERVER IN $(($DURATION / 60)) minutes and $(($DURATION % 60)) seconds." >> $PATH_PROJECT_LOG/log.log
