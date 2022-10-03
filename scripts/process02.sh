# create ctm-file

fname=${1}

cmd="cat ${fname} \
	's/[0-9][0-9]*/ & /g'  \
	's/ ء / /g' \
	's/\// /g' \
	's/�~A/�~G/g' \
	's/�~@~X/ /g' \
	's/�~@~Y/ /g' \
	's/�~L/ /g' \
	's/ئ/ء/g' \
	's/�~@~\/ /g' \
	's/�~@~]/ /g' \
	's/ﷺ/ /g' \
	's/-/ /g' \
	's/�~T/\n/g' \
	's/ٴ/ /g' \
	's/:/ /g' \
	's/\./ /g' \
	's/�~_/ /g' \
	's/!/ /g' \
	\"s/'/ /g\" \
	's/\�~[/ /g' \
	's/)/ /g' \
	's/(/ /g' \
	's/ؤ/ء�~H/g' \
	's/�~S/ء�~R/g' \
	's/%/ /g' \
	's/\^/ /g' \
	's/?//g' \
	's/\,//g' \
	's/,//g' \
  > ${fname}1 "
#echo $cmd
eval $cmd

cmd="cat ${fname}1 \
	's/\xd9\x8f//g' \
	's/\xd9\x91//g' \
	's/\xd9\x92//g' \
	's/\xd9\x8e//g' \
	's/\xd9\x90//g' \
	's/\xd9\xb0//g' \
	's/\xd9\x8b//g' \
	's/\xEF\xBB\xBF//' \
	's/\xd8\xa3/\xd8\xa7/g' \
	's/�~J/�~L/g' \
	's/۱/1/g' \
	's/۲/2/g' \
	's/۳/3/g' \
	's/۴/4/g' \
	's/۵/5/g' \
	's/٦/6/g' \
	's/۷/7/g' \
	's/۸/8/g' \
	's/۹/9/g' \
	's/۰/0/g' \
	's/۶/ء/g' \
  > ${fname}2 "
#echo $cmd
eval $cmd

cmd="cat ${fname}2 \
	 's/saou/ /g' \
	 's/ 00/ /g' \
	 's/ 0/ /g' \
	 's/100/sou/g' \
        > ${fname}3 "
#echo $cmd
eval $cmd

cmd="cat ${fname}3 \
	| sed  's/ 1 / ا�~Lک /g' \
	| sed  's/ 2 / د�~H /g' \
	| sed  's/ 3 / ت�~L�~F /g' \
	| sed  's/ 4 / �~Fار /g' \
	| sed  's/ 5 / پا�~F�~F /g' \
	| sed  's/ 6 / �~Fھ /g' \
	| sed  's/ 7 / سات /g' \
	| sed  's/ 8 / آٹھ /g' \
	| sed  's/ 9 / �~F�~H /g' \
	| sed  's/ 10 / دس /g' \
	| sed  's/ 11 / گ�~Lار�~G /g' \
	| sed  's/ 12 / بار�~G /g' \
	| sed  's/ 13 / ت�~Lر�~G /g' \
	| sed  's/ 14 / �~F�~Hد�~G /g' \
	| sed  's/ 15 / پ�~Fدر�~G /g' \
	| sed  's/ 16 / س�~H�~D�~G /g' \
	| sed  's/ 17 / ستر�~G /g' \
	| sed  's/ 18 / اٹھار�~G /g' \
	| sed  's/ 19 / ا�~F�~Lس /g' \
	| sed  's/ 20 / ب�~Lس /g' \
	| sed \"s/\ \ \ / /g\" \
	| sed  's/ ا�~Lک �~Gزار �~F�~H س�~H / ا�~F�~Lس س�~H /g' \
        > ${fname}4 "
#echo $cmd
eval $cmd

cmd="cat ${fname}4 \
	| sed 's/ 21 / اک�~Lس /g'  \
	| sed 's/ 22 / باء�~Lس /g'  \
	| sed 's/ 23 / تء�~Lس /g'  \
	| sed 's/ 24 / �~F�~Hب�~Lس /g'  \
	| sed 's/ 25 / پ�~F�~Lس /g'  \
	| sed 's/ 26 / �~Fھب�~Lس /g'  \
	| sed 's/ 27 / ستاء�~Lس /g'  \
	| sed 's/ 28 / اٹھاء�~Lس /g'  \
	| sed 's/ 29 / ا�~Fت�~Lس /g'  \
	| sed 's/ 30 / ت�~Lس /g'  \
	| sed 's/ 31 / اکت�~Lس /g'  \
	| sed 's/ 32 / بت�~Lس /g'  \
	| sed 's/ 33 / ت�~L�~Fت�~Lس /g'  \
	| sed 's/ 34 / �~F�~H�~Fت�~Lس /g'  \
	| sed 's/ 35 / پ�~L�~Fت�~Lس /g'  \
	| sed 's/ 36 / �~Fھت�~Lس /g'  \
	| sed 's/ 37 / س�~L�~Fت�~Lس /g'  \
	| sed 's/ 38 / ا�~Qت�~Lس /g'  \
	| sed 's/ 39 / ا�~Fتا�~D�~Lس /g'  \
	| sed 's/ 40 / �~Fا�~D�~Lس /g'  \
	| sed 's/ 41 / اکتا�~D�~Lس /g'  \
	| sed 's/ 42 / ب�~Lا�~D�~Lس /g'  \
	| sed 's/ 43 / ت�~Fتا�~D�~Lس /g'  \
	| sed 's/ 44 / �~F�~H�~Fتا�~D�~Lس /g'  \
	| sed 's/ 45 / پ�~Fتا�~D�~Lس /g'  \
	| sed 's/ 46 / �~Fھ�~Lا�~D�~Lس /g'  \
	| sed 's/ 47 / س�~Fتا�~D�~Lس /g'  \
	| sed 's/ 48 / ا�~Qتا�~D�~Lس /g'  \
	| sed 's/ 49 / ا�~F�~Fاس /g'  \
	| sed 's/ 50 / پ�~Fاس /g'  \
        > ${fname}5 "
#echo $cmd
eval $cmd

cmd="cat ${fname}5 \
	's/ 51 / اک�~Lا�~H�~F /g'  \
	's/ 52 / با�~H�~F /g'  \
	's/ 53 / تر�~Lپ�~F /g'  \
	's/ 54 / �~F�~H�~F /g'  \
	's/ 55 / پ�~Fپ�~F /g'  \
	's/ 56 / �~Fھپ�~F /g'  \
	's/ 57 / ستا�~H�~F /g'  \
	's/ 58 / اٹھا�~H�~F /g'  \
	's/ 59 / ا�~Fسٹھ /g'  \
	's/ 60 / ساٹھ /g'  \
	's/ 61 / اکسٹھ /g'  \
	's/ 62 / باسٹھ /g'  \
	's/ 63 / تر�~Lسٹھ /g'  \
	's/ 64 / �~F�~H�~Fسٹھ /g'  \
	's/ 65 / پ�~L�~Fسٹھ /g'  \
	's/ 66 / �~Fھ�~Lاسٹھ /g'  \
	's/ 67 / س�~Qسٹھ /g'  \
	's/ 68 / ا�~Qسٹھ /g'  \
	's/ 69 / ا�~F�~Gتر /g'  \
	's/ 70 / ستر /g'  \
	's/ 71 / اک�~Gتر /g'  \
	's/ 72 / ب�~Gتر /g'  \
	's/ 73 / ت�~Gتر /g'  \
	's/ 74 / �~F�~H�~Gتر /g'  \
	's/ 75 / پ�~Fھتر /g'  \
	's/ 76 / �~Fھ�~Gتر /g'  \
	's/ 77 / ستتر /g'  \
	's/ 78 / اٹھتر /g'  \
	's/ 79 / ا�~Fاس�~L /g'  \
	's/ 80 / اس�~L /g'  \
        > ${fname}6 "
#echo $cmd
eval $cmd

cmd="cat ${fname}6 \
	's/ 81 / اک�~Lاس�~L /g'  \
	's/ 82 / ب�~Lاس�~L /g'  \
	's/ 83 / تراس�~L /g'  \
	's/ 84 / �~F�~Hراس�~L /g'  \
	's/ 85 / پ�~Fاس�~L /g'  \
	's/ 86 / �~Fھ�~Lاس�~L /g'  \
	's/ 87 / ستاس�~L /g'  \
	's/ 88 / اٹھاس�~L /g'  \
	's/ 89 / �~F�~Hاس�~L /g'  \
	's/ 90 / �~F�~H�~R /g'  \
	's/ 91 / اک�~Lا�~F�~H�~R /g'  \
	's/ 92 / با�~F�~H�~R /g'  \
	's/ 93 / ترا�~F�~H�~R /g'  \
	's/ 94 / �~F�~Hرا�~F�~H�~R /g'  \
	's/ 95 / پ�~Fا�~F�~H�~R /g'  \
	's/ 96 / �~Fھ�~Lا�~F�~H�~R /g'  \
	's/ 97 / ستا�~F�~H�~R /g'  \
	's/ 98 / اٹھا�~F�~H�~R /g'  \
	's/ 99 / �~F�~Fا�~F�~H�~R /g'  \
		> ${fname}7 "
#echo $cmd
eval $cmd

cmd="cat ${fname}7 \
	| tr '\n' ' ' \
	| perl -pe 's/\r/ /g' \
	> ${fname}8 "
#echo $cmd
eval $cmd

mv ${fname} ${fname}0
mv ${fname}8 ${fname}

rm ${fname}?

iconv -f windows-1252 -t ASCII//TRANSLIT -o $fname $fname
