#!/usr/bin/python3.5
###########
###
### KnowledgeIsChicken.py
###
### Script that calls a Bash script in order to re-assemble randomly previously cropped pictures
### It then uses the twitter api to Tweet the created picture
###
### Author : Julien AVENET - julien@datapopcorn.com - julien@avenetj.fr
### 
### Versionning
###	13/11/16 : Script creation 
###     14/11/16 : Usage of re to get the 3 parts of the name - Then use it to create Hashtags
### MIT Licence
###
##########

import subprocess
import os
import sys
import tweepy
import glob
import re

def main():
    consumer_key = ''
    consumer_secret = ''
    access_token = ''
    access_token_secret = ''
	### Twitter auth 
    auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
    auth.set_access_token(access_token, access_token_secret)
    api = tweepy.API(auth)
    generate_newpic = subprocess.call("bash assemble_pic.bash", shell=True)
    picture_dir = '/path/to/KnowledgeIsChicken/Result/'
    picture = max(glob.iglob(picture_dir+'*.jpg'), key=os.path.getctime)
    name = picture.split("Result/")[1]
    name = name.split(".")[0]
    hash=re.findall('[A-Z][^A-Z]*', name)
    status="#"+hash[0]+" #"+hash[1]+" #"+hash[2]
    api.update_with_media(picture, status="%s" % (status))

if __name__ == "__main__":
    main()
