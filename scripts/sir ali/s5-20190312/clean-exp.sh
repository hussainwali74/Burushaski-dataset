#!/bin/bash

rm -rf exp data burushaski/mfcc
mkdir -p data/local/dict
cp /kaldi/Burushaski-dataset/text/g2p/result.txt data/local/dict/burushaskidict-plain.txt
cd burushaski
#rm -rf extracted/*
#rm -rf selected/*
#./get-transcripts.sh
cd selected
#ln -s ../extracted/* .
cd ../..
rm *.fst
