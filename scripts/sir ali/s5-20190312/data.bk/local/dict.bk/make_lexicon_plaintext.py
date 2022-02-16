#!
# coding: utf-8

import codecs
import urllib2
import time

print "Hello, World!"

phoneme_list=[]
word_list=[]


def is_phoneme(s1):
	#print s1
	try:
		i = phoneme_list.index(s1)
		return 1
	except ValueError:
        	return 0 # no match
	

def pronun(l2):
	str1=""
	len1=len(l2)
	i=0
	while i<len1:
		if i+4<len1:
			if is_phoneme(l2[i:i+5])==1:
				str1=str1+" "+l2[i:i+5]
				i=i+5
				continue
		if i+3<len1:
			if is_phoneme(l2[i:i+4])==1:
				str1=str1+" "+l2[i:i+4]
				i=i+4
				continue
		if i+2<len1:
			if is_phoneme(l2[i:i+3])==1:
				str1=str1+" "+l2[i:i+3]
				i=i+3
				continue
		if i+1<len1:
			if is_phoneme(l2[i:i+2])==1:
				str1=str1+" "+l2[i:i+2]
				i=i+2
				continue
		if  is_phoneme(l2[i])==1:
			str1=str1+" "+l2[i]
			i=i+1
			continue
		i=i+1
			
	return str1	


infile1 = codecs.open("urdu-lexicon","r","utf-8")
outfile = codecs.open("urdu-lexicon.txt","w","utf-8")
i=0
j=0

while infile1:
	line1 = infile1.readline()
	l1=line1.split();
	if(len(l1)<1):
		print "short line\n"
		break
	i=i+1
	print i

	phonflag=0
	if(l1[0]=="<lemma>" or l1[0]=="</lemma>"):
		continue	
	for x in l1:
		if x=="<orth>":
			x=x
		elif  x=="</orth>":
			x=x
		elif x=="<phon>":
			phonflag=1
			outfile.write(lastorth+" ")
		elif x=="</phon>":
			phonflag=0
			outfile.write("\n")
		elif phonflag==0:
			lastorth=x
		else:
			outfile.write(x+" ")
					
	



infile1.close()
outfile.close()


