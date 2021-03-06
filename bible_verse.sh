#!/bin/bash

function random_verse {
    ping -q -w1 -c1 google.com &>/dev/null &&
        data=$(curl -s https://beta.ourmanna.com/api/v1/get\?format\=json\&order\=random) &&
        display_verse $data
    }

function daily_verse {
    ping -q -w1 -c1 google.com &>/dev/null &&
        data=$(curl -s https://beta.ourmanna.com/api/v1/get\?format\=json)
        display_verse $data
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
    [ "$BIBLE_DAILY_VERSE" != "1" ] &&
        random_verse ||
        daily_verse
}

print_verse
