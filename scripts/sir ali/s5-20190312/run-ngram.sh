#!/bin/bash

# Copyright 2012 Vassil Panayotov
# Apache 2.0

# NOTE: You will want to download the data set first, before executing this script.
#       This can be done for example by:
#       1. Setting the DATA_ROOT variable to point to a directory with enough free
#          space (at least 20-25GB currently (Feb 2014))
#       2. Running "getdata.sh"

# The second part of this script comes mostly from egs/rm/s5/run.sh
# with some parameters changed

. ./path.sh || exit 1

# If you have cluster of machines running GridEngine you may want to
# change the train and decode commands in the file below
. ./cmd.sh || exit 1

# The number of parallel jobs to be started for some parts of the recipe
# Make sure you have enough resources(CPUs and RAM) to accomodate this number of jobs
njobs=4

# This recipe can select subsets of VoxForge's data based on the "Pronunciation dialect"
# field in VF's etc/README files. To select all dialects, set this to "English"
dialects="Urdu"

# The number of randomly selected speakers to be put in the test set
nspk_test=40

# Test-time language model order
lm_order=3

# Word position dependent phones?
pos_dep_phones=true

# The directory below will be used to link to a subset of the user directories
# based on various criteria(currently just speaker's accent)
selected=${DATA_ROOT}/selected

# The user of this script could change some of the above parameters. Example:
# /bin/bash run.sh --pos-dep-phones false
. utils/parse_options.sh || exit 1

[[ $# -ge 1 ]] && { echo "Unexpected arguments"; exit 1; } 


which ngram

ngram-count -order 1 -text data/local/tmp/corpus.txt | sort -k2 -n -r  > data/local/tmp/corpus-count.txt

awk 'NR==FNR{words[$1]; next;} ($1 in words)' \
  data/local/tmp/corpus-count.txt data.bk/local/dict/lexicon-10112017.txt \
   > data.bk/local/dict/lexicon-freq-10112017.txt





