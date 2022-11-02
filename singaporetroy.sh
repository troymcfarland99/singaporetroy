#! /bin/bash

# navigate to directory with needed files

cat rawsing.csv | gcut -d, -f3-5 --complement rawsing.csv > trimsing.csv

rm formatsing.csv
for i in {3..44}
do

diseasename=$(head -1 trimsing.csv | cut -d, -f$i)
cat trimsing.csv | sed 1d | cut -d, -f1,2,$i | awk -v dname="$diseasename" -F"," '{ OFS = "," } {$4=dname; print}' >> formatsing.csv

done

