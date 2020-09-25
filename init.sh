#!/bin/bash

read -p "Enter your command: " newcommand

if [ $newcommand == 'init' ] 
then
    docker-compose build
    docker-compose run web rails db:migrate
    # docker-compose run web rails db:seed
elif [ $newcommand == 'reload' ] 
then
    docker-compose down
    docker-compose up
elif [ $newcommand == 'build' ] 
then 
    docker-compose build
elif [ $newcommand == 'migrate' ]
then
    docker-compose run web rails db:migrate
elif [ $newcommand == 'seed' ]
then
    docker-compose run web rails db:seed
fi
exit 0