#!/bin/sh

#------------------
# Set-up AAXtoMP3
#------------------
# Download AAX to MP3
wget https://github.com/KrumpetPirate/AAXtoMP3/archive/master.zip -O downloads/aaxtomp3.zip

# Extract to folder using 'unzip'
unzip downloads/aaxtomp3.zip -d aaxtomp3/


#--------------------------
# Set-up Audible-Activator
#--------------------------
# Download
wget https://github.com/inAudible-NG/audible-activator/archive/master.zip -O downloads/audible-activator.zip

# Extract to folder using 'unzip'
unzip downloads/audible-activator.zip -d activator/

# Downloading prerequisites (Requests, Selenium, ChromeDriver)
sudo pip install requests
sudo pip install selenium
wget https://chromedriver.storage.googleapis.com/LATEST_RELEASE -O downloads/chromedriver-latest-release.txt
LATEST_CHROMEDRIVER_VERSION=$(cat downloads/chromedriver-latest-release.txt)
wget https://chromedriver.storage.googleapis.com/index.html?path=$LATEST_CHROMEDRIVER_VERSION/chromedriver_linux64.zip -O downloads/chrome-driver-latest.zip
unzip downloads/chrome-driver-latest.zip -d activator/

# Activation code
OUTPUT=$(exif python activator/audible-activator.py | tail -1)

# Converting AAX to MP3
bash aaxtomp3/AAXtoMP3.sh $OUTPUT 