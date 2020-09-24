#!/bin/bash

read -p "Enter your command: " newcommand

if [ $newcommand == 'init' ] 
then
    docker-compose build
elif [ $newcommand == 'reload' ] 
then
    docker-compose down
    docker-compose up
elif [ $newcommand == 'build' ] 
then 
    docker-compose -d build
fi
exit 0