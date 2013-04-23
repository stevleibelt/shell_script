#/bin/bash
####
#
####
# @author artodeto
# @since 2013-04-23
####

URL_FEED='https://raw.github.com/propelorm/Propel/master/CHANGELOG'
DIR_SELF=$(cd $(dirname "$0"); pwd);
FILE_TO_DIFF='CHANGELOG_TO_DIFF'

$(wget -q $URL_FEED)

if [ -f "$FILE_TO_DIFF" ]; then
    $(diff CHANGELOG $FILE_TO_DIFF)
    $(rm CHANGELOG)
else
    echo First run, no file exists so far.
    $(mv CHANGELOG $FILE_TO_DIFF)
fi
