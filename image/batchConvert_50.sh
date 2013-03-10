#!/bin/sh
m#####
# resizes existing images with ending *.jpg to a size of 50px.
#
# @author stev leibelt
# @since 2012-07-29
####
mkdir resized_50
for f in *.[jJ][pP][gG]
do convert $f -verbose -resize 50% -quality 98% -comment "proud made with linux" resized_50/$f
#do convert $f -verbose -resize 25% -quality 90% -comment "proud made with linux" resized/$f
#do convert $f -verbose -resize 6% -quality 90% -comment "proud made with linux" resized/thumb_$f
done
