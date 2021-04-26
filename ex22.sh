#!/usr/bin/bash
# Avraham Bar Ilan

# function like ex21 script
function21 () {
fileType_=$1
word_=$2
# iterate over the files
for f in *.$fileType_;
do
    # if it is a directory 
    if [ -d $f ];
        then continue
    fi
    # print the line
    grep -ihw $word_ $f 2>/dev/null
done
return
}

# main function of this script
function22 () {
_dirPath=$1
_fileType=$2
_word=$3
_num=$4 

cd $_dirPath
# call the function to print the files
function21 $_fileType $_word | awk -v LEN=$4 'NF>=LEN'

# if there are no folders here 
if find -type d $(pwd) -maxdepth 1 2>/dev/null; then
    return
fi
# iterate over files in the directory
for FILE in *;
do 
    # if it is a directory
    if [ -d $FILE ]; then
        # call this function recursively
        function22 $FILE $_fileType $_word $_num
    else
        continue   
    fi
done
cd ..
return
}

# script start from here
# if we got less arguments
if [ -z "${4}" ]; then
    echo Not enough parameters
    exit
fi
# the recursive function
function22 $1 $2 $3 $4
exit
