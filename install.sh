#!/bin/bash

check=`grep "setup_bible_verses" .bashrc &> /dev/null`
if [ "$check" = "" ]; then
    echo "Setting up .bashrc bible script..."
    text=`curl -s https://gist.githubusercontent.com/emelent/6a18bb8015664877dc605baa40cd10d3/raw/23a54e5419db4c4db7bff43db196c6f3d0c6119c/setup_bible_verses.sh` &&
    echo $text >> .bashrc &&
    echo "\nGreat, your .bashrc is now setup for bible verses. 😁" ||
    echo "Setup failed, make sure you're online then try again. 😕"
else
    echo "Your .bashrc is already setup for bible verses. 😋"
fi
