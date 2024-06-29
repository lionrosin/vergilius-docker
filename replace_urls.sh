#!/bin/bash

# Path to the head.pug file
HEAD_PUG_FILE="/app/vergilius-project/src/main/resources/templates/partials/head.pug"

# Define the URLs and their replacements
declare -A URL_REPLACEMENTS=(
    ["https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"]="/css/bootstrap.min.css"
    ["https://cdn.jsdelivr.net/npm/socicon@3.0.5/css/socicon.min.css"]="/css/socicon.min.css"
    ["https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"]="/js/jquery.slim.min.js"
    ["https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"]="/js/bootstrap.min.js"
    ["https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"]="/js/popper.min.js"
    ["https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.7.1/clipboard.min.js"]="/js/clipboard.min.js"
)

# Loop through each URL and perform the replacement
for URL in "${!URL_REPLACEMENTS[@]}"
do
    REPLACEMENT="${URL_REPLACEMENTS[$URL]}"
    sed -i "s|${URL}|${REPLACEMENT}|g" "${HEAD_PUG_FILE}"
done

echo "URL replacements have been applied in ${HEAD_PUG_FILE}"
