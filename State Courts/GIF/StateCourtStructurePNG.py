#@@ -0,0 +1,49 @@
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jun 3 14:52:54 2019
Updated on Fri April 23 2021

@author: michelle

Description: Created to retrieve gifs of state court structures and save as png. 

Notes: I believe this was written in Mousepad, updated years later in RStudio. 
"""
 
import sys
import requests
import pandas as pd
import textract
import csv
from PIL import Image, ImageDraw, ImageFont #dynamic import


states = ['wyoming', 'wisconsin', 'westvirginia', 'washington', 'virginia',
      'vermont', 'utah', 'texas', 'tennessee', 'southdakota', 
      'southcarolina', 'rhodeisland', 'pennsylvania', 'oregon', 
      'oklahoma', 'ohio', 'northdakota', 'northcarolina',
      'newyork', 'newmexico', 'newjersey', 'newhampshire', 
      'nevada', 'nebraska', 'montana', 'missouri', 'mississippi', 
      'minnesota', 'michigan', 'massachusetts', 'maryland', 'maine', 
      'louisiana', 'kentucky', 'kansas', 'iowa', 'indiana', 'illinois', 
      'idaho', 'hawaii', 'georgia', 'florida', 'district of columbia',
      'delaware', 'connecticut', 'colorado', 'california', 'arkansas',
      'arizona', 'alaska', 'alabama']

path = "/home/michelle/Dropbox/Data and Projects/Data/State Courts/"

for s in range(0,len(states)):
    while s < len(states): 
        url = "https://www.ncsc.org/~/media/Microsites/Images/CSP/State_Structure_Charts/" + states[s] + ".gif"
        response = requests.get(url)
        if response.status_code==200:
            print(states[s])
            file = path+"GIF/"+states[s]+".gif" 
            with open(file, 'wb') as f:
                f.write(requests.get(url).content)
            img = Image.open(path+"GIF/"+states[s]+'.gif')
            img.save(path+states[s]+".png",'png', optimize=True, quality=70)
            break 
        if response.status_code!=200:
            print("BAD URL ", states[s]) 
            break 



    
