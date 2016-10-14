#!/bin/sh

LOGIN=$1
PASSWORD=$2
FILES=$3

#------------------
# Set-up AAXtoMP3
#------------------
if [ ! -d "AAXtoMP3-master" ]; then
	echo "Downloading AAXtoMP3..."
	wget https://github.com/KrumpetPirate/AAXtoMP3/archive/master.zip -O aaxtomp3.zip
	unzip aaxtomp3.zip
	rm aaxtomp3.zip
fi

#--------------------------
# Set-up Audible-Activator
#--------------------------
if [ ! -d "audible-activator-master" ]; then
	echo "Downloading audible-activator..."
	wget https://github.com/inAudible-NG/audible-activator/archive/master.zip -O audible-activator.zip
	unzip audible-activator.zip
	rm audible-activator.zip

	echo "Downloading Chrome-Driver-Latest..."
	wget https://chromedriver.storage.googleapis.com/LATEST_RELEASE -O chromedriver-latest-release.txt
	LATEST_CHROMEDRIVER_VERSION=$(cat chromedriver-latest-release.txt)
	wget https://chromedriver.storage.googleapis.com/$LATEST_CHROMEDRIVER_VERSION/chromedriver_linux64.zip -O chrome-driver-latest.zip
	unzip chrome-driver-latest.zip
	rm chrome-driver-latest.zip
fi

# Downloading prerequisites (Requests, Selenium)
sudo pip install requests
sudo pip install selenium

#--------------------------
# Getting activation code
#--------------------------
OUTPUT=$(python audible-activator-master/audible-activator.py | tail -1)

#--------------------------
# Converting files
#--------------------------
bash AAXtoMP3-master/AAXtoMP3.sh $OUTPUT $1