#!/bin/sh
####

INPUT_FILE=$1
OUTPUT_FILE=$1'.cleaned.sed'

sed -n -e 's/[\d128-\d255]//g' $INPUT_FILE > $OUTPUT_FILE
#sed -i 's/[^[:print:]]//' $INPUT_FILE > $OUTPUT_FILE
