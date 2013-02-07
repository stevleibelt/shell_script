#!/bin/sh
#####
# resizes existing images with ending *.jpg to a size of 256px.
#
# @author stev leibelt
# @since 2012-07-29
####
mkdir resized_256px
for f in *.jpg
do convert $f -verbose -geometry 256x256 -quality 98% -comment "proud made with linux" resized_256px/$f
done
