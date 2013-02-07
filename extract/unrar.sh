#!/bin/sh
#####
# unrars all available *.rar files in given directory.
#
# @author stev leibelt
# @since 2012-07-29
####
for f in *.rar
do
	mkdir ${f%.rar}
	unrar e $f ${f%.rar}/
done
