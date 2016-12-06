#!/bin/bash
###########
###
### generate.bash
### Reads from files : sentences, fonts, colors
### Creates 1/3 of image with a word of the random sentence
### Then merge the 3 images to create 1
### 
###
### Author : Julien AVENET - julien@datapopcorn.com - julien@avenetj.fr
### 
### Versionning
###	13/11/16 : Script creation 
###	14/11/16 : Add a new way of chosing colors : from a file instead of generating them
###			   it's principaly for design reasons as the random colors can be ugly
###
### MIT Licence
###
##########

for j in {1..10}
do
	random_back=`shuf -n 1 colors`
	text_color="404040"
	text=`shuf -n 1 phrases`
	font=`shuf -n 1 fonts`
	name=`echo $text | tr -d " \t\n\r"`
	for i in {1..3}
	do	
		word=`echo $text | cut -d " " -f $i`
		convert -size 300x300 -background "#$random_back" -fill "#$text_color" -font "$font" -pointsize 41 -gravity center label:$word out_$i.jpg
	done
	convert +append out_1.jpg out_2.jpg out_3.jpg ../Crafting/$name.jpg
	rm out_*
done
