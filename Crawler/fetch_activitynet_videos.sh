#!/bin/bash

VIDEOPATH=video/

mkdir temp
for i in `seq 1 31`
do
    TEMP_FILE="temp/operate$i.txt"
    JSON_FILE="sublist/sublist$i.json"
    if [ -d $VIDEOPATH ]; then
        python run_crosscheck.py $VIDEOPATH $JSON_FILE $TEMP_FILE
        if [ -f $TEMP_FILE ]; then
            bash $TEMP_FILE
        else
            echo "File $TEMP_FILE does not exists."
        fi
    else
        echo "Directory does not exists."
        exit 0
    fi
done
#rm $TEMP_FILE
echo "Have a good day!"
