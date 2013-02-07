#!/bin/sh
#####
# resizes existing images with ending *.jpg to a size of 1920px.
#
# @author stev leibelt
# @since 2012-07-29
####
mkdir resized_1920px
for f in *.jpg
do convert $f -verbose -geometry 1920x1920 -quality 98% -comment "proud made with linux" resized_1920px/$f
done
