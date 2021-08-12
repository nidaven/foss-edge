#! /bin/bash

#TODO Check for existing container services at start before env file

echo "
Running background checks
============================================
"
# echo ""
if [ -s ../.env ] #TODO Add extra code to check for complete .env file configuration
then
    echo 'Non-empty .env file found in local directory
    '
    echo ' - Press 0 to overwrite existing .env file'
    echo ' - Press 1 to use existing .env file'
    echo ' - Press 2 to print content of .env file
    '
    read -p ' - response: ' envqueryresponse
    if [ $envqueryresponse = 0 ]
    then
        ./env_writer.sh
    elif [ $envqueryresponse = 1 ]
    then 
        echo 'Using existing .env file'
    elif [ $envqueryresponse = 2 ]
    then 
        echo ''
        echo 'Printing contnents of existing .env file to screen'
        echo '==============================================
        '
        cat .env
        echo ''
        read -p 'Enter yes to continue overwriting and no to use existing: ' continueoverwrite
        if [ $continueoverwrite = 'yes' ]
        then
            echo 'Overwriting .env file: '
            ./env_writer.sh 
        elif [ $continueoverwrite = 'no' ]
        then 
            echo 'Using existing .env file'
        fi
    else 
        echo ''
        echo 'Unrecognised response.    Exiting'
    fi
else
    ./env_writer.sh
fi


read -p 'Build services and start? [yes/no]: ' buildresponse
if [ "$buildresponse" = "yes" ]
then
    #TODO remove substitue commands
    echo 'Building services...'
    sleep 2
    echo 'Done'
    # docker-compose up -d build
else
    echo 'Skipping build and quitting.'
fi