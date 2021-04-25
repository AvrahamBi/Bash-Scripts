#!/bin/bash
# Avraham Bar Ilan 205937949

# no flags = true
no_flags=0

if [ "$1" = "system" ]; then
    for flag in "$@" ;
    do
        case $flag in
        --name)
        no_flags=1
            
        ;;
        --version)
        no_flags=1
        
        ;;
        --pretty_name)
        no_flags=1
            
        ;;
        --home_url)
        no_flags=1
        
        ;;
        --support_url)
        no_flags=1
            
        ;;
        esac
    done
    if [ 0 -eq $no_flags ]; then
    echo system didnt got flag
    fi
    exit
fi


if [ "$1" = "host" ]; then
    for flag in "$@" ;
    do
        case $flag in
        --static_hostname)
        no_flags=1
        
        ;;
        --icon_name)
        no_flags=1
        
        ;;
        --machine_id)
        no_flags=1
         
        ;;
        --boot_id)
        no_flags=1
        
        ;;
        --virtualization)
        no_flags=1
            
        ;;
        --kernel)
        no_flags=1
            
        ;;
        --architecture)
        no_flags=1
            
        ;;
        esac
        
    done
    if [ 0 -eq $no_flags ]; then
    echo host didnt got flag
    fi
    exit
fi

