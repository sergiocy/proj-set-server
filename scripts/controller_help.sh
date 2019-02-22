#!/bin/bash

info_general(){
    echo 'That is a program developed to install software in a centOS server' 
    echo 'or load data in diferent data sources'    
}

info_software_available(){

    # i want that information reading directories in software folder
    # function to read folder it must be in function_utils scripts
    echo 'SOFTWARE AVAILABLE: '
    echo 'hadoop'
    echo 'spark'
    echo 'hive'
}

info_args(){
    echo '--software : to select the software (in the list of software available) to install'
    echo '--dir : folder installation software'

    echo '--help : help'
}