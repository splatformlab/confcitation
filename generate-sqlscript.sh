#!/bin/bash

filename="$1"
outfile="$2"

line_cnt=0

while read -r line
do
	line_cnt=$((line_cnt+1))
	name=$(echo $line | awk 'BEGIN {FS=" "} END{print $1}')
	echo "select pa.* from author au LEFT JOIN paper pa on au.paper_key=pa.paper_key where au.name='$line' into outfile '/var/lib/mysql-files/$name$line_cnt' fields terminated by '|' lines terminated by '\n';" >> $2

done < "$filename"

