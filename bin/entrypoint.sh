#!/bin/bash -e
SCRIPT="bin/$1.sh"
if [ -f $SCRIPT ]
then
    . $SCRIPT
else
    . "bin/help.sh"
fi