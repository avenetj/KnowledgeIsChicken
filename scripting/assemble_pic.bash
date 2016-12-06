#!/bin/bash
###########
###
### assemble_pic.bash
### Takes random pictures from Directories (First, Second and Third)
### Assembles the 3 pics, from convinience, make them all the same dimension 
###
### Author : Julien AVENET - julien@datapopcorn.com - julien@avenetj.fr
### 
### Versionning
###	13/11/16 : Script creation 
###	14/11/16 : Usage of Text in name to create name of output
### MIT Licence
###
##########

### Select 3 random part of pic from the dataset
### Using relative link for now ! 
f_part=`ls ../First/ | shuf -n 1` 
s_part=`ls ../Second/ | shuf -n 1`
t_part=`ls ../Third/ | shuf -n 1`

### This thing cut a sentence that is like "AbbbCcccE" in "Abbb Ccccc E"
w1=`echo $f_part | sed -e 's|\([A-Z][^A-Z]\)| \1|g' -e 's|\([a-z]\)\([A-Z]\)|\1 \2|g' | cut -d " " -f2`
w2=`echo $s_part | sed -e 's|\([A-Z][^A-Z]\)| \1|g' -e 's|\([a-z]\)\([A-Z]\)|\1 \2|g' | cut -d " " -f3`
w3=`echo $t_part | sed -e 's|\([A-Z][^A-Z]\)| \1|g' -e 's|\([a-z]\)\([A-Z]\)|\1 \2|g' | cut -d " " -f4 | cut -d "-" -f1`

#Name crafting
name=`echo $w1$w2$w3`
convert +append ../First/$f_part ../Second/$s_part ../Third/$t_part ../Result/$name.jpg
