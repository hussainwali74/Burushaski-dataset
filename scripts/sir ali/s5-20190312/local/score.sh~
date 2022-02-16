#!/bin/bash
# Copyright 2012  Johns Hopkins University (Author: Daniel Povey)
# Apache 2.0

[ -f ./path.sh ] && . ./path.sh

# begin configuration section.
cmd=run.pl
min_lmwt=3
max_lmwt=27
#end configuration section.

[ -f ./path.sh ] && . ./path.sh
. parse_options.sh || exit 1;

if [ $# -ne 3 ]; then
  echo "Usage: local/score.sh [--cmd (run.pl|queue.pl...)] <data-dir> <lang-dir|graph-dir> <decode-dir>"
  echo " Options:"
  echo "    --cmd (run.pl|queue.pl...)      # specify how to run the sub-processes."
  echo "    --min_lmwt <int>                # minumum LM-weight for lattice rescoring "
  echo "    --max_lmwt <int>                # maximum LM-weight for lattice rescoring "
  exit 1;
fi

data=$1
lang_or_graph=$2
dir=$3

symtab=$lang_or_graph/words.txt

for f in $symtab $dir/lat.1.gz $data/text; do
  [ ! -f $f ] && echo "score.sh: no such file $f" && exit 1;
done

mkdir -p $dir/scoring/log

cat $data/text | sed 's:<NOISE>::g' | sed 's:<SPOKEN_NOISE>::g' > $dir/scoring/test_filt.txt

$cmd LMWT=$min_lmwt:$max_lmwt $dir/scoring/log/best_path.LMWT.log \
  lattice-best-path --lm-scale=LMWT --word-symbol-table=$symtab \
    "ark:gunzip -c $dir/lat.*.gz|" ark,t:$dir/scoring/LMWT.tra || exit 1;

# Note: the double level of quoting for the sed command
$cmd LMWT=$min_lmwt:$max_lmwt $dir/scoring/log/score.LMWT.log \
   cat $dir/scoring/LMWT.tra \| \
    utils/int2sym.pl -f 2- $symtab \| sed 's:\<UNK\>::g' \| \
    compute-wer --text --mode=present \
     ark:$dir/scoring/test_filt.txt  ark,p:- ">&" $dir/wer_LMWT || exit 1;

# Show results
for f in $dir/wer_*; do echo $f; egrep  '(WER)' < $f; done

best_lmwt=17

for a in 1 6 11 16 21 26 31 36 41 46 51 56 61 66 71 76 81 86 91 96 \
         101 106 111 116 121 126 131 136 141 146 151 156 161 166 171 176 181 186 191 196; do
	b=$(($a+4))
	c="$a,${b}p"
	echo $b $c
	cat $dir/scoring/test_filt.txt | sed -n $c > $dir/scoring/test_filt_$a.txt
	cat $dir/scoring/${best_lmwt}.tra | sed -n $c > $dir/scoring/${best_lmwt}_$a.tra

	# Note: the double level of quoting for the sed command
	$cmd LMWT=$best_lmwt $dir/scoring/log/score.LMWT_$a.log \
	   cat $dir/scoring/${best_lmwt}_$a.tra  \| \
	    utils/int2sym.pl -f 2- $symtab \| sed 's:\<UNK\>::g' \| \
	    compute-wer --text --mode=present \
	     ark:$dir/scoring/test_filt_$a.txt  ark,p:- ">&" $dir/Wer_${best_lmwt}_$a || exit 1;
done



echo
echo

# Show results
for f in $dir/Wer_${best_lmwt}_?; do echo $f; egrep  '(WER)' < $f; done
for f in $dir/Wer_${best_lmwt}_??; do echo $f; egrep  '(WER)' < $f; done
for f in $dir/Wer_${best_lmwt}_???; do echo $f; egrep  '(WER)' < $f; done








exit 0;
