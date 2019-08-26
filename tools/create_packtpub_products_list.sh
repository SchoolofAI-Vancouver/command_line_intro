#!/bin/bash

#################################################################################
#
# Create list of packtpub products
# https://www.packtpub.com/all-products
#
#################################################################################


search_files="/home/johannes/Documents/school_of_ai_vancouver/intro_to_commandline/downloads/packtpub_products.html*"

all_products=$(grep -A1 'product-item-link' $search_files | xargs -n3 -d'\n')

#echo "All Products:"
#echo "$all_products"
output_file="$(date +"%F")-packtpub-products.csv"

truncate -s 0 $output_file
echo "#,product_title,product_link" > $output_file

count=0
while read -r line
do
	count=$((count+1))
	#echo -e "\n$count,$line\n"

	link=$(echo "$line" | grep -o "href=.\+>" | cut -d'"' -f2)
	#echo "Link:$link"

	# get title
	title=$(echo "$line" | grep -o "html_[0-9]\{1,3\}-.\+" | sed "s/.\+[0-9]\{1,3\}-//g; s/ <\/a.\+//g; s/&#039;/'/g")
	#echo "Title:$title"

	echo "$count,$title,$link"
	echo "$count,$title,$link" >> $output_file

done <<< "$all_products"

echo -e "\nScript Completed!"
