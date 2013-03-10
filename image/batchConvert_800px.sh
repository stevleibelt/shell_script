#!/bin/sh
#####
# resizes existing images with ending *.jpg to a size of 800px.
#
# @author stev leibelt
# @since 2012-07-29
####
mkdir resized_800px
for f in *.[jJ][pP][gG]
do convert $f -verbose -geometry 800x800 -quality 98% -comment "proud made with linux" resized_800px/$f
done
