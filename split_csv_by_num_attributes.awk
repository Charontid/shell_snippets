#! /usr/bin/awk -f

#call the script with -v attributes=<number_of_attributes> <filename>
#the output will be a file clean csv with rows having <number_of_attributes>
#and a 2nd file bad_rows with the line, number of attributes and the original line appended


BEGIN   {
	FS="|"
	bad_row_count = 0
	#attributes=2
	print "expected number of attributes per row: " attributes;
}

NF!=attributes {
	bad_row_count = bad_row_count + 1
	print NR " " NF " " $0 > "bad_rows";
}

NF==attributes {
	print $0 > "good_rows"
}

END {
	print "rows total: " NR " ,  bad rows: " bad_row_count
}
