#!/bin/bash

FILEINDEX=0
DOCFILES=/usr/share/man/man3/*.gz
VIMVERSION=7.4
HELPFILE=allman.txt
FILECOUNT=$(echo $DOCFILES | wc -w)

rm $HELPFILE
echo -e "*$HELPFILE*\tfor Vim version $VIMVERSION\tLast Change: $(date +'%Y %B %d')" >> $HELPFILE
echo "" >> $HELPFILE
echo "             C++ Standard Template Library Reference" >> $HELPFILE
echo "" >> $HELPFILE
for FILE in /usr/share/man/man3/*; do
echo "$FILE"
	FILENAME=${FILE##*/}
	BASENAME=$(echo "$FILENAME" | sed 's/\..*$//g')
	BASENAMELENGTH=$(echo "$BASENAME" | wc -c)
	OFFSET=$(( 78 - $BASENAMELENGTH ))
	let $((FILEINDEX++))
	printf "Processing file %s of %s\r" $FILEINDEX $FILECOUNT
	echo "===============================================================================" >> $HELPFILE
	for (( s=0; s<$OFFSET; s++ ))
	do
		echo -n " " >> $HELPFILE
	done
	echo "*$BASENAME*" >> $HELPFILE
	echo "" >> $HELPFILE
	#man $BASENAME | sed '1d;$d' | sed '0,/^Example/s//Example >/' >> $HELPFILE
	man $BASENAME | sed '1d;$d' | sed 's/\(^Example[+]\?\)/\1 >/g' >> $HELPFILE
	echo >> $HELPFILE
	#echo "" >> $HELPFILE
	#[ "$FILEINDEX" -gt 10 ] && exit
done
echo "Generating tag file..."
vim -c "helptags ./ | q"
echo "done"
