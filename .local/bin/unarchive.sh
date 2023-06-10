#!/bin/sh

[ -z $1 ] && echo "unarchive.sh: Usage: archive.sh [file]" 1>&2 && exit 1
[ ! -f $1 ] && echo "unarchive.sh: $1: No such file or directory." 1>&2 && exit 1

fname=$( echo $1 | head -c -5 )

[ -f $fname ] && echo "unarchive.sh: $fname: File already exists." 1>&2 && exit 1

key=$(grep "^key (hex):" "$fname-key-iv.txt" | cut -d' ' -f 3)
iv=$(grep "^iv (hex):" "$fname-key-iv.txt" | cut -d' ' -f 3)

printf "key: %s\niv: %s\n" $key $iv

openssl enc -aes-256-cbc -d -in "$1" -out "$fname" -nosalt -K $key -iv $iv

echo "Successfully decrypted $1 to $fname"
