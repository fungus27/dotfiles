#!/bin/sh

curl wttr.in/Moon --silent | sed '/^$/d;$d'
