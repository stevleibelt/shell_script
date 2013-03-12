#!/bin/sh
####
# removes ascii control characters
# base on: http://www.bo.infn.it/alice/alice-doc/mll-doc/linux/vi-ex/node15.html
#
# @author stev leibelt
# @since 2013-03-12
####

if [[ $# -eq 1 ]]; then
  START_DATE=$(date +"%s")
  FILE=$1
  CLEANED_FILE=$1'.cleaned'

  echo 'Cleaning file "'$FILE'"'

  tr -d '\000-\031' < "$FILE" > "$CLEANED_FILE"

  echo 'File "'$CLEANED_FILE'" created'
  END_DATE=$(date +"%s")
  DIFF_DATE=$(($END_DATE-$START_DATE))
  echo "$(($DIFF_DATE / 60)) minutes and $(($DIFF_DATE % 60)) seconds elapsed."
fi
