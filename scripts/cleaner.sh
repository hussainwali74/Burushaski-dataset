# 24/10/2022
# created to clean multiple lines and remove diamonds issue in text files
# run from Burushaski/audios/cleaner.sh
#!/bin/bash

a=1
for d in ./*; do
  if [[ -d $d ]]; then 
    touch ${d}/ascii_output.txt ;
    touch ${d}/ascii_output2.txt ;
    for f in ${d}/*.txt; do
      awk 'NF' ${f} > ${d}/ascii_output.txt; #remove next lines
      sed -i 's/[\?\~\.\!\,]//g' ${d}/ascii_output.txt; #remove question marks and other special chars
      iconv -f utf8 -t ascii//TRANSLIT < ${d}/ascii_output.txt > ${d}/ascii_output2.txt ;
      if cmp --silent -- "${d}/ascii_output2.txt" "${f}"; then
        #if same file do nothing
        echo 'same files, nothing to worry about';
        cat ${f};
      else
        cp ${d}/ascii_output2.txt ${f} ;
      fi
    done;
    rm ${d}/ascii_output.txt;
    rm ${d}/ascii_output2.txt;
  fi
  a=$(($a + 1));
done;
