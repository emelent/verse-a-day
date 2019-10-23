#!/bin/bash

check=`grep "setup_bible_verses" .bashrc &> /dev/null`
if [ "$check" = "" ]; then
    echo "Setting up .bashrc bible script..."
    text=$(curl -s https://raw.githubusercontent.com/emelent/verse-a-day/master/bashrc) &&
        echo $text >> .bashrc &&
        echo "\nGreat, your .bashrc is now setup for bible verses. 😁" ||
        echo "Setup failed, make sure you're online then try again. 😕"
else
    echo "Your .bashrc is already setup for bible verses. 😋"
fi
