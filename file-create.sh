#!/bin/bash

mkdir -p sample_data

for ((i=0; i<10; i++)); do
    mkdir -p sample_data/newFiles$i

    sleep 0.5
    date > sample_data/newFile.txt
    pwd >> sample_data/newFile.txt
    
    sleep 0.5
    cp sample_data/newFile.txt sample_data/newFiles$i/

    rm -f sample_data/newFile.txt
done

echo "work done!"

