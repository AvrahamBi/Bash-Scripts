#!/bin/bash
# Avraham Bar Ilan

# boolean variable to know if we got flags
no_flags=0
# if the first word was system
if [ "$1" = "system" ]; then
    for flag in "$@" ;
    do
        case $flag in
        --name)
        # we got flag so no_flags get false value
        no_flags=1
        # print the specific line and cut it
        awk 'NR==1' os-release | cut -c7-12
        ;;
        --version)
        # we got flag so no_flags get false value
        no_flags=1
        # print the specific line and cut it
        awk 'NR==2' os-release | cut -c10-34
        ;;
        --pretty_name)
        no_flags=1
        awk 'NR==5' os-release | cut -c14-31 
        ;;
        --home_url)
        no_flags=1
        awk 'NR==7' os-release | cut -c11-33
        ;;
        --support_url)
        no_flags=1
        awk 'NR==8' os-release | cut -c14-37    
        ;;
        esac
    done
    # if no flags were found
    if [ 0 -eq $no_flags ]; then
        # print the whole file
        cat os-release
    fi
    exit
fi


if [ "$1" = "host" ]; then
    for flag in "$@" ;
    do
        case $flag in
        --static_hostname)
        no_flags=1
        awk 'NR==1' hostnamectl | cut -c21-35
        ;;
        --icon_name)
        no_flags=1
        awk 'NR==2' hostnamectl | cut -c21-31
        ;;
        --machine_id)
        no_flags=1
        awk 'NR==4' hostnamectl | cut -c21-52
        ;;
        --boot_id)
        no_flags=1
        awk 'NR==5' hostnamectl | cut -c21-52
        ;;
        --virtualization)
        no_flags=1
        awk 'NR==6' hostnamectl | cut -c21-24
        ;;
        --kernel)
        no_flags=1
        awk 'NR==8' hostnamectl | cut -c21-43    
        ;;
        --architecture)
        no_flags=1
        awk 'NR==9' hostnamectl | cut -c21-26    
        ;;
        esac
        
    done
    if [ 0 -eq $no_flags ]; then
        cat hostnamectl
    fi
    exit
fi
# if user didnt give a valid host\system flag
echo Invalid input
exit



