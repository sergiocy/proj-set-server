#!/bin/bash


value_exists_in_list(){
    list_to_search=$2
    echo 'en fon de control'
    accepted=0

    for i in "${list_to_search[@]}"
    do
        if [ "$i" == "$1" ]
        then
            accepted=1
        fi
    done
   
    return $accepted
}




####
#### dummy function "main" to import functions as source
#### in main() we put test functions
#main(){
#    control_value_software hadoop 
#    res=$?
#    echo "$res"
#}

#if [ "${1}" != "--source-only" ]; then
#    main 
#fi

