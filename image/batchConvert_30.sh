#!/bin/sh
m#####
# resizes existing images with ending *.jpg to a size of 30px.
#
# @author stev leibelt
# @since 2012-07-29
####
kdir resized_30
for f in *.jpg
do convert $f -verbose -resize 30% -quality 98% -comment "proud made with linux" resized_30/$f
#do convert $f -verbose -resize 25% -quality 90% -comment "proud made with linux" resized/$f
#do convert $f -verbose -resize 6% -quality 90% -comment "proud made with linux" resized/thumb_$f
done
