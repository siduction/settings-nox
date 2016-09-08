#/bin/bash

TERMINAL=$(ps | grep $$ | awk '{ print $2 }' | uniq 2>/dev/null)

echo $TERMINAL

case ${TERMINAL} in
    pts*)
        export TERM="xterm-256color"
        ;;
    tty*)
        export TERM=linux
        ;;
esac

