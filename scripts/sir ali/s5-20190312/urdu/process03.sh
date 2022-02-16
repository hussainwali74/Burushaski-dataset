# create ctm-file

fname=${1}

cmd="cat ${fname} \
	| sed 's/[0-9][0-9]*/ & /g'  \
	| sed 's/ ء / /g' \
	| sed 's/\// /g' \
	| sed 's/ہ/ه/g' \
	| sed 's/‘/ /g' \
	| sed 's/’/ /g' \
	| sed 's/،/ /g' \
	| sed 's/ئ/ء/g' \
	| sed 's/“/ /g' \
	| sed 's/”/ /g' \
	| sed 's/ﷺ/ /g' \
	| sed 's/-/ /g' \
	| sed 's/۔/\n/g' \
	| sed 's/ٴ/ /g' \
	| sed 's/:/ /g' \
	| sed 's/\./ /g' \
	| sed 's/؟/ /g' \
	| sed 's/!/ /g' \
	| sed \"s/'/ /g\" \
	| sed 's/\؛/ /g' \
	| sed 's/)/ /g' \
	| sed 's/(/ /g' \
	| sed 's/ؤ/ءو/g' \
	| sed 's/ۓ/ءے/g' \
	| sed 's/%/ /g' \
	| sed 's/\^/ /g' \
	> ${fname}1 "
#echo $cmd
eval $cmd


cmd="cat ${fname}1 \
	| sed 's/\xd9\x8f//g' \
	| sed 's/\xd9\x91//g' \
	| sed 's/\xd9\x92//g' \
	| sed 's/\xd9\x8e//g' \
	| sed 's/\xd9\x90//g' \
	| sed 's/\xd9\xb0//g' \
	| sed 's/\xd9\x8b//g' \
	| sed 's/\xEF\xBB\xBF//' \
	| sed 's/\xd8\xa3/\xd8\xa7/g' \
	| sed 's/ي/ی/g' \
	| sed 's/۱/1/g' \
	| sed 's/۲/2/g' \
	| sed 's/۳/3/g' \
	| sed 's/۴/4/g' \
	| sed 's/۵/5/g' \
	| sed 's/٦/6/g' \
	| sed 's/۷/7/g' \
	| sed 's/۸/8/g' \
	| sed 's/۹/9/g' \
	| sed 's/۰/0/g' \
	| sed 's/۶/ء/g' \
	> ${fname}2 "
#echo $cmd
eval $cmd


cmd="cat ${fname}2 \
 | tr '\n' ' ' \
 | perl -pe 's/\r/ /g' \
	> ${fname}8 "
#echo $cmd
eval $cmd

mv ${fname} ${fname}0
mv ${fname}8 ${fname}

rm ${fname}?



