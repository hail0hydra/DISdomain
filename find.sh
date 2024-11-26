#!/usr/bin/bash


# Author: s1ck
#
#
# status: still to add output options.

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
BOLD='\033[1m'
BG_RED='\033[41m'
BG_GREEN='\033[42m'
RESET='\033[0m'

echo
echo
echo

echo -e "$BOLD$BG_RED INTERNAL DNS REV-LOOKUP$RESET"

echo
echo
echo




if [ -z $1  ]; then
    echo -e "$BLUE Usage: $0 [8 | 16 | 24] $RESET"
    exit 1
fi


function slash_eight(){

    for i in {1..256}; do
        for j in {1..256}; do
            for k in {1..256};do
                echo -e "$PURPLE-------------------------------------$RESET"
                echo 
                echo -e "$BLUE[*]$RESET for $BOLD$GREEN$network.$i.$j.$k:$RESET "
                host "$network.$i.$j.$k"  | grep -vi NXDOMAIN
                echo 
                echo -e "$PURPLE-------------------------------------$RESET"
            done
        done
    done

}


function slash_sixteen(){
    for i in {1..256}; do
        for j in {1..256};do
            echo -e "$PURPLE-------------------------------------$RESET"
            echo 
            echo -e "$BLUE[*]$RESET for $BOLD$GREEN$network.$i.$j:$RESET "
            host "$network.$i.$j"  | grep -vi NXDOMAIN
            echo 
            echo -e "$PURPLE-------------------------------------$RESET"
        done
    done

}

function slash_twofour(){
    for i in {1..256};do
        echo -e "$PURPLE-------------------------------------$RESET"
        echo 
        echo -e "$BLUE[*]$RESET for $BOLD$GREEN$network.$i:$RESET "
        host "$network.$i"  | grep -vi NXDOMAIN
        echo 
        echo -e "$PURPLE-------------------------------------$RESET"
    done

}


if [ "$1" -eq 8 ]; then
    read -p "Enter first octet: " network
    slash_eight network
    exit 0
elif [ "$1" -eq 16 ]; then
    read -p "Enter first two octets (x.x): " network
    slash_sixteen
    exit 0
elif [ "$1" -eq 24 ]; then
    read -p "Enter first three octets (x.x.x): " network
    slash_twofour
    exit 0 
fi

