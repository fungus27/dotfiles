#!/bin/sh

case "$(file --dereference --brief --mime-type -- "$1")" in
    text/*) head -n $3 "$1";;
    *) w=$((($2-10)/6)); hx "$1" -c $w -l $(($3 * $w)) -t 1;;
esac
#w=$((($2-10)/6))
#h=$(($3 * $w))
#hx $1 -c $w -l $h -t 1
