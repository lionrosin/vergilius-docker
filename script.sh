#!/bin/bash

# Define the file path
filePath="build.gradle"

# Define the search and replace strings
searchString="pug4j:2.2.1-SNAPSHOT"
replaceString="pug4j:2.2.0"

# Check if the file exists
if [ -f "$filePath" ]; then
    # Use sed to find and replace the string in-place
    sed -i "s/$searchString/$replaceString/g" "$filePath"
    echo "Replacement done in $filePath."
else
    echo "File $filePath does not exist."
fi