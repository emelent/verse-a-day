
function setup_bible_verses {
    test -f ~/.bible_verse.sh ||
        curl https://raw.githubusercontent.com/emelent/verse-a-day/master/bible_verse.sh > ~/.bible_verse.sh
    source ~/.bible_verse.sh
}

setup_bible_verses

export BIBLE_DAILY_VERSE=0
