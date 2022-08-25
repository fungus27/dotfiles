#!/bin/sh

set -u
set -e
minutes=${1:-'120'}
repeats=$(( minutes - 1 ))
center=${2:-'2'}
wave=${3:-'0.000333333'}
noise='brown'
len='01:00'

if [ $minutes -eq 1 ] ; then
     progress='--show-progress'
else
     progress='--no-show-progress'
fi
echo " ::  Please stand-by... sox will 'play' $noise noise for $minutes minute(s)."

play $progress -S  -c 2  --null  synth  $len  ${noise}noise  \
     band -n $center 499               \
     tremolo $wave    43   reverb 19   \
     bass -11              treble -1   \
     vol     14dB                      \
     repeat  $repeats

exit 0
