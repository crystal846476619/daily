#!/bin/bash
###################################################################
# File Name: add_user.sh
# Author: magic_sauce
# mail: magic846476619@gmail.com
# Created Time: Mon 19 Mar 2018 02:00:50 PM CST
###################################################################
user='sky'
pass='123456'

function create(){
re=$(cat /etc/passwd | grep -w $user | wc -l )
if [[ $re -eq 0 ]];then
    useradd $user
    pass=$(echo $pass | passwd $user --stdin)
    echo "$user  ALL=(ALL)   ALL" >> /etc/sudoers && echo "User $user is create ok!"  #Provide root permission support
    chage -M 30 $user && echo "The $user account is valid for 30 days"   #Setting up user expiration time
    else
    echo "$user is already exists"
    exit 2
fi
}

function main(){
if [[ $USER != "root"  ]];then
    echo "must be root!"
    exit 3
fi
	create
}

main

