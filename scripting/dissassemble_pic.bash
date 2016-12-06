#!/bin/bash
###########
###
### disassemble_pic.bash
### Takes a picture given as arg and crop it in 3 parts 
###
### Author : Julien AVENET - julien@datapopcorn.com - julien@avenetj.fr
### 
### Versionning
###	13/11/16 : Script creation 
###	14/11/16 : Disassemble every pic present in the directory path/to/Crafting	
###
### MIT Licence
###
##########
search_dir="/path/to/KnowledgeIsChicken/Crafting"
for picture in "$search_dir"/*
do
	name_pic=`echo $picture | cut -d. -f 1`

	### Find a way to get image s dimension
	width=`identify -format "%w" $picture`
	height=`identify -format "%h" $picture`

	### How many vertical crops
	crop=3

	### vertical crops
	width_crop=`echo $((width / crop))`

	convert "$picture" -crop "$width_crop"x"$height" "$picture"

	### Yeah that s dirty but I need only 3 crops and a tidy workspace
	mv "$name_pic"*0* ../First/
	mv "$name_pic"*1* ../Second/
	mv "$name_pic"*2* ../Third/
done

