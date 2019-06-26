#!/bin/bash

fmd=${1?"*** base64 file, e.g. debug.md"}
util=$(basename $fmd)
fexe=/tmp/${util%.md}.exe
cat $fmd | sed 's/```//g' | base64 -d > $fexe
md5sum $fexe
