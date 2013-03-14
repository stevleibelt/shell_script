#!/bin/bash
####
# script to compare two xml files by unique tag
####
# @author stev leibelt
# @since 2013-03-13
####

if [[ $# -eq 3 ]]; then
  XML_FILE_ONE="$1"
  XML_FILE_TWO="$2"
  XML_TAG="$3"

  #retrieving xml_tags per file
  #reduce xmls by lines containg the tag
  sed -n -e 's/.*<'$XML_TAG'>\(.*\)<\/'$XML_TAG'>.*/\1/p' $XML_FILE_ONE > $XML_FILE_ONE'.sed'
  sed -n -e 's/.*<'$XML_TAG'>\(.*\)<\/'$XML_TAG'>.*/\1/p' $XML_FILE_TWO > $XML_FILE_TWO'.sed'

  #sort and uniq the sed'ed files
  sort $XML_FILE_ONE'.sed' | uniq > $XML_FILE_ONE'.sort'
  sort $XML_FILE_TWO'.sed' | uniq > $XML_FILE_TWO'.sort'

  #output the differences
  diff $XML_FILE_ONE'.sort' $XML_FILE_TWO'.sort' > 'xml_diff_by_tag.diff'
  #diff --side-by-side $XML_FILE_ONE'.sort' $XML_FILE_TWO'.sort' > 'xml_diff_by_tag.diff'
  #comm -3 $XML_FILE_ONE'.sort' $XML_FILE_TWO'.sort' > 'xml_diff_by_tag.comm'

  #show only differences per file
  sed -n -e 's/^<\ \(.*\)/\1/p' 'xml_diff_by_tag.diff' > $XML_FILE_ONE'.diff.uniq'
  sed -n -e 's/^>\ \(.*\)/\1/p' 'xml_diff_by_tag.diff' > $XML_FILE_TWO'.diff.uniq'

  #sed -n -e 's/^<\(.*\)/<\1/p' 'xml_diff_by_tag.comm' > $XML_FILE_ONE'.comm.uniq'
  #sed -n -e 's/\t<\(.*\)/<\1/p' 'xml_diff_by_tag.comm' > $XML_FILE_TWO'.comm.uniq'

  #removing unused files
  rm -fr $XML_FILE_ONE'.sed' $XML_FILE_TWO'.sed' $XML_FILE_ONE'.sort' $XML_FILE_TWO'.sort'
else
  echo 'Invalid number of arguments provided'
  echo 'try '$0' $xmlFileOne $xmlFileTwo $comparingTag'
fi
