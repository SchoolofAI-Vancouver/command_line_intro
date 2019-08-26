#!/bin/bash

echo -e "\nScript Start"


base_url="https://www.packtpub.com/all-products?released=Available"

download_file_name="downloads/packtpub_products.html"

num_pages=10

echo "Getting $num_pages packtpub product pages..."

for i in $(seq $num_pages)
do
    page_download_file="${download_file_name}_${i}"

    # set first page url
    if [[ $i == 1 ]]
	then
		url=$base_url
	
	# set subsequent pages urls
    else
		url="${base_url}&page=${i}"
    fi

    echo -e "\n$i/$num_pages - Downloading '$url' to '$page_download_file'..."
    curl -# $url > $page_download_file

done

echo -e "\nScript Completed!"
