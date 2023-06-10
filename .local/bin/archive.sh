#!/bin/sh

[ -z $1 ] && echo "archive.sh: Usage: archive.sh [file]" 1>&2 && exit 1
[ ! -f $1 ] && echo "archive.sh: $1: No such file or directory." 1>&2 && exit 1
[ -f "$1.enc" ] && echo "archive.sh: $1.enc: File already exists." 1>&2 && exit 1

key=$(head -c 32 /dev/urandom | hexdump -e '"%x"')
iv=$(head -c 16 /dev/urandom | hexdump -e '"%x"')

printf "key (hex): %s\niv (hex): %s\n" $key $iv
printf "alg: aes-256-cbc\nkey (hex): %s\niv (hex): %s\n" $key $iv >> "$1-key-iv.txt"

openssl enc -aes-256-cbc -e -in "$1" -out "$1.enc" -nosalt -K $key -iv $iv

echo "Successfully encrypted $1 into $1.enc"
