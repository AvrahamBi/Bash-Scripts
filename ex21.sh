#!/usr/bin/bash

# the user arguments
dirPath=$1
fileType=$2
word=$3

# check if user gave 3 parameters
if [ -z "${word}" ]; then
    echo Not enough parameters
fi
# cd to the given path
cd $dirPath
# iterates over the files with the given suffix
for FILE in *.$fileType;
do
    # if it is a directory 
    if [ -d $FILE ];
        then continue
    fi
    # print the line where the givn word is
    grep -hw $word $FILE
done

exit
