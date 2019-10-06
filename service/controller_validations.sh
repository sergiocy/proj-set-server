#!/bin/bash

validate_data_or_software(){
    args=$@
   
    exists=0

    if [[ "${args[@]}" =~ "--data" ]]
    then
        exists=`expr $exist + 1` 
    fi

    if [[ "${args[@]}" =~ "--software" ]]
    then
        exists=`expr $exists + 1`
    fi

    if [[ $exists == 2 ]]
    then
        exists=1
    else
        exists=0
    fi

    return $exists
}

validate_exists_software(){
    #### here we will validate if software exists
    echo 'validate_exists_software'
}

validate_exists_dataset(){
    #### here we will validate if dataset exists
    echo 'validate_exists_dataset'
}