#!/bin/bash

filename="$1"
outfile="$2"

title=""
line_cnt=0

while read -r line
do
	line_cnt=$((line_cnt+1))
	#if ["$line_cnt" -gt "$3" ]; then
	if ((line_cnt > $3)) ; then
		name="$line"
	        title=$(echo $name | awk 'BEGIN {FS="|"} END{print $1}')
	        confyear=$(echo $name | awk 'BEGIN {FS="|"} END{print $2}')
	        confname=$(echo $name | awk 'BEGIN {FS="|"} END{print $3}')
		#echo $title
		citation=$(python scholar.py -c 1 --phrase "`echo $title`")
		#echo $citation
		pos=$(echo $citation | awk '{print index($0, "Citations")}')
		newstr=$(echo $citation | awk '{print substr($0, '$pos', '$pos'+30)}')
		#echo $newstr
		ctnum=$(echo $newstr | awk '{print $2}')
		#echo $ctnum
		#echo $line_cnt
		#echo "$title |$confname |$confyear | $ctnum" 
		echo "$title |$confname |$confyear | $ctnum" >>$2
		#sleep 61
	fi
done < "$filename"

