#!/bin/bash

test -z "$MESSAGE" && printf "I need you to specify a MESSAGE\n" && exit
test -z "$SECRET" && printf "I need you to should specify a SECRET\n" && exit
test -z "$N" && printf "I need you to specify a number of codes to generate N\n" && exit
test -z "$PREFIX" && printf "You could specify a filename PREFIX\n" 

MESSAGE="ontbijt_voor_nablus" \
PREFIX=${PREFIX-qr-} \
N=${N-20} ./generate-n.sh

zip qrs.zip *.png
rm *.png
