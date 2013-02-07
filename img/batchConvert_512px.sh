#!/bin/sh
#####
# resizes existing images with ending *.jpg to a size of 512px.
#
# @author stev leibelt
# @since 2012-07-29
####
mkdir resized_512px
for f in *.jpg
do convert $f -verbose -geometry 512x512 -quality 98% -comment "proud made with linux" resized_512px/$f
done
