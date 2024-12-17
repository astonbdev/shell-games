#!/bin/bash

convert_type=$1
zipfile=$2

#remove existing tmp directory
rm -rf tmp

# Make the directory and copy the file you want
# to it
mkdir tmp;
cp levels.zip tmp/

cd tmp;

echo "convert_type $convert_type";
echo "zipfile $zipfile";

# with the copy, unzip the contents and remove zip
unzip "$zipfile"
rm "$zipfile"

cd zip

#for each file in this directory
for file in *; do
  #if this is a regular file
  if [ -f "$file" ]; then
    #rename it by finding the extension and replacing
    #it with .json
    # % is the start of a pattern match
    # the pattern is . '*' representing any pattern after a .
    
    mv "$file" "${file%.*}.json"
  fi
done