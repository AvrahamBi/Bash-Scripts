#!/usr/bin/bash
# Avraham Bar Ilan 205937949

function21 () {
fileType_=$1
word_=$2

for f in *.$fileType_;
do
    # if it is a directory 
    if [ -d $f ];
        then continue
    fi
    grep -ihw $word_ $f
done
return
}

#set +x
function22 () {
_dirPath=$1
_fileType=$2
_word=$3
_num=$4 

cd $_dirPath

function21 $_fileType $_word
if find -type d $(pwd) -maxdepth 1 2>/dev/null; then
    return
fi

for FILE in *;
do 
    if [ -d $FILE ]; then
        function22 $FILE $_fileType $_word $_num
    else
        continue   
    fi
done
cd ..
return
}
#set -x

if [ -z "${4}" ]; then
    echo Not enough parameters
fi

function22 $1 $2 $3 $4

exit
