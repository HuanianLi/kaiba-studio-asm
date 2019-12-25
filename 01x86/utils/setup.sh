#!/bin/bash

masmroot=${1?"*** root dir of masm, e.g. /var/tmp/masmroot"}

mdfiles=""
mdfiles+=" dosbox/debug.md"
mdfiles+=" dosbox/link.md"
mdfiles+=" dosbox/masm.md"
mdfiles+=" dosbox/tasm.md"

[[ ! -d $masmroot/bin ]] && mkdir $masmroot/bin

for mdfile in $mdfiles; do
	src_file=$(bash md2exe.sh $mdfile | awk '{print $2}')
	dst_file=$masmroot/bin/$(basename $src_file)
	echo cp $src_file $dst_file
	eval cp $src_file $dst_file
	rm -f $src_file
done

ls -l $masmroot/bin/*.exe
