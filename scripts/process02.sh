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
	| sed 's/?//g' \
	| sed 's/\,//g' \
	| sed 's/,//g' \

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
 | sed  's/saou/ /g' \
 | sed  's/ 00/ /g' \
 | sed  's/ 0/ /g' \
 | sed  's/100/sou/g' \
	> ${fname}3 "
#echo $cmd
eval $cmd


cmd="cat ${fname}3 \
 | sed  's/ 1 / ek /g' \
 | sed  's/ 2 / do /g' \
 | sed  's/ 3 / teen /g' \
 | sed  's/ 4 / chaar /g' \
 | sed  's/ 5 / paanch /g' \
 | sed  's/ 6 / chhe /g' \
 | sed  's/ 7 / sat /g' \
 | sed  's/ 8 / atth /g' \
 | sed  's/ 9 / no /g' \
 | sed  's/ 10 / das /g' \
 | sed  's/ 11 / gyaara /g' \
 | sed  's/ 12 / bara /g' \
 | sed  's/ 13 / tera /g' \
 | sed  's/ 14 / choda /g' \
 | sed  's/ 15 / pandra /g' \
 | sed  's/ 16 / solla /g' \
 | sed  's/ 17 / satra /g' \
 | sed  's/ 18 / atthaara /g' \
 | sed  's/ 19 / unees /g' \
 | sed  's/ 20 / bees /g' \
 | sed \"s/\ \ \ / /g\" \
 | sed  's/ ایک هزار نو سو / انیس سو /g' \
	> ${fname}4 "
#echo $cmd
eval $cmd

cmd="cat ${fname}4 \
 | sed 's/ 21 / ekees /g'  \
 | sed 's/ 22 / baayees /g'  \
 | sed 's/ 23 / trayees /g'  \
 | sed 's/ 24 / chobees /g'  \
 | sed 's/ 25 / pachees /g'  \
 | sed 's/ 26 / chabees /g'  \
 | sed 's/ 27 / sataayis /g'  \
 | sed 's/ 28 / atthayees /g'  \
 | sed 's/ 29 / unatees /g'  \
 | sed 's/ 30 / tees /g'  \
 | sed 's/ 31 / ekatees /g'  \
 | sed 's/ 32 / batees /g'  \
 | sed 's/ 33 / tentees /g'  \
 | sed 's/ 34 / chontees /g'  \
 | sed 's/ 35 / pentees /g'  \
 | sed 's/ 36 / chhatees /g'  \
 | sed 's/ 37 / sentees /g'  \
 | sed 's/ 38 / adtees /g'  \
 | sed 's/ 39 / untalees /g'  \
 | sed 's/ 40 / chalees /g'  \
 | sed 's/ 41 / ektaalees /g'  \
 | sed 's/ 42 / biyaalees /g'  \
 | sed 's/ 43 / tentaalees /g'  \
 | sed 's/ 44 / chontaalees /g'  \
 | sed 's/ 45 / pentaalees /g'  \
 | sed 's/ 46 / cheyaalees /g'  \
 | sed 's/ 47 / sentaalees /g'  \
 | sed 's/ 48 / adtaalees /g'  \
 | sed 's/ 49 / unchaas /g'  \
 | sed 's/ 50 / pachaas /g'  \
	> ${fname}5 "
#echo $cmd
eval $cmd

cmd="cat ${fname}5 \
 | sed 's/ 51 / ekiyavan /g'  \
 | sed 's/ 52 / baavan /g'  \
 | sed 's/ 53 / trepan /g'  \
 | sed 's/ 54 / chovan /g'  \
 | sed 's/ 55 / pachpan /g'  \
 | sed 's/ 56 / chepan /g'  \
 | sed 's/ 57 / satavan /g'  \
 | sed 's/ 58 / atthavan /g'  \
 | sed 's/ 59 / unsatth /g'  \
 | sed 's/ 60 / saatth /g'  \
 | sed 's/ 61 / iksatth /g'  \
 | sed 's/ 62 / basatth /g'  \
 | sed 's/ 63 / trensatth /g'  \
 | sed 's/ 64 / chonsatth /g'  \
 | sed 's/ 65 / pensatth /g'  \
 | sed 's/ 66 / chaasatth /g'  \
 | sed 's/ 67 / sathsatth /g'  \
 | sed 's/ 68 / adsatth /g'  \
 | sed 's/ 69 / unhatar /g'  \
 | sed 's/ 70 / satar /g'  \
 | sed 's/ 71 / ikathar /g'  \
 | sed 's/ 72 / bahatar /g'  \
 | sed 's/ 73 / tehatar /g'  \
 | sed 's/ 74 / chohatar /g'  \
 | sed 's/ 75 / pachatar /g'  \
 | sed 's/ 76 / chehatar /g'  \
 | sed 's/ 77 / satatar /g'  \
 | sed 's/ 78 / atthatar /g'  \
 | sed 's/ 79 / unaasee /g'  \
 | sed 's/ 80 / asee /g'  \
	> ${fname}6 "
#echo $cmd
eval $cmd

cmd="cat ${fname}6 \
 | sed 's/ 81 / ekees /g'  \
 | sed 's/ 82 / biyaasi /g'  \
 | sed 's/ 83 / teraasi /g'  \
 | sed 's/ 84 / choraasi /g'  \
 | sed 's/ 85 / pachaasi /g'  \
 | sed 's/ 86 / chhiyaasi /g'  \
 | sed 's/ 87 / sataasi /g'  \
 | sed 's/ 88 / atthaasi /g'  \
 | sed 's/ 89 / nawaasi /g'  \
 | sed 's/ 90 / nawe /g'  \
 | sed 's/ 91 / ikaanve /g'  \
 | sed 's/ 92 / baanve /g'  \
 | sed 's/ 93 / teryaanve /g'  \
 | sed 's/ 94 / choraanve /g'  \
 | sed 's/ 95 / pachaanve /g'  \
 | sed 's/ 96 / chhiyaanve /g'  \
 | sed 's/ 97 / sataanve /g'  \
 | sed 's/ 98 / atthaanve /g'  \
 | sed 's/ 99 / naneenve /g'  \
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

iconv -f windows-1252 -t ASCII//TRANSLIT -o $fname $fname #this line has not been tested, from previous code
