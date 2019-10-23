#!/bin/bash

function random_verse {
    ping -q -w1 -c1 google.com &>/dev/null &&
        data=`curl -s https://beta.ourmanna.com/api/v1/get\?format\=json\&order\=random` &&
        print_verse $data
    }

function daily_verse {
    data=`curl -s https://beta.ourmanna.com/api/v1/get\?format\=json`
    print_verse $data
}

function display_verse {
    # clear grep options just incase, use alias instead
    GREP_OPTIONS=
    alias grep="grep --color=auto"

    # print verse text
    echo
    echo $* | grep -Po '"text":.*?[^\\]",' | sed s/\"text\"://g | sed s/\"// | sed s/\",// | sed 's/\\//g'| pr -to5 | fmt

    # print verse reference
    ref=$(echo $* | grep -Po '"reference":.*?[^\\]"' | sed s/\"reference\"://g | sed s/\"//g)
    vsn=$(echo $* | grep -Po '"version":.*?[^\\]"' | sed s/\"version\"://g | sed s/\"//g)
    echo -e "\n\033[0;34m$ref ($vsn)\033[0m\n" | pr -to5
}

function print_verse {
    [ $BIBLE_DAILY_VERSE -eq 1 ] &&
        daily_verse ||
        random_verse -eq 1
}
print_verse
