#!/bin/sh

set -u
set -e
minutes=${1:-'120:00'}
center=${2:-'2'}
wave=${3:-'0.000333333'}
noise='brown'
len='01:00'

echo " ::  Please stand-by... sox will 'play' $noise noise for $minutes."

play --show-progress -c 2  --null  synth  $minutes  ${noise}noise  \
     band -n $center 499               \
     tremolo $wave    43   reverb 19   \
     bass -11              treble -1   \
     vol     14dB                      \

exit 0
