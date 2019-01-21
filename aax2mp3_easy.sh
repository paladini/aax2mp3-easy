#!/bin/bash

LOGIN=$1
PASSWORD=$2
FILES=$3

# Check if the number of arguments is equal or greater than 3.
if [ "$#" -lt 3 ]; then
    echo "Illegal number of parameters, expecting at least 3. Usage:"
    echo -e "  $ bash aax2mp3_easy.sh <audible_login> <audible_password> <files_to_be_converted.aax> \n"
    exit 1
fi

#------------------
# Set-up AAXtoMP3
#------------------
if [ ! -d "AAXtoMP3-master" ]; then
	echo "Downloading AAXtoMP3..."
	brew install wget
	wget https://github.com/KrumpetPirate/AAXtoMP3/archive/master.zip -O aaxtomp3.zip
	unzip aaxtomp3.zip
	rm aaxtomp3.zip

	brew install ffmpeg
	brew install gnu-sed
	brew install grep
	brew install mp4v2
fi

#--------------------------
# Set-up Audible-Activator
#--------------------------
if [ ! -d "audible-activator-feature_login_as_arg" ]; then
	echo "Downloading audible-activator..."
	brew install wget
	wget https://github.com/paladini/audible-activator/archive/feature_login_as_arg.zip -O audible-activator.zip
	unzip audible-activator.zip
	rm audible-activator.zip

	echo "Downloading Chrome-Driver-Latest..."
	if [ $(uname) == "Darwin" ]; then
		# Install Chrome-Driver for OSX
		brew cask install chromedriver
		ln -fs `which chromedriver` chromedriver
	else
		brew install wget
		# Install Chrome-Driver for Linux
		wget https://chromedriver.storage.googleapis.com/LATEST_RELEASE -O chromedriver-latest-release.txt
		LATEST_CHROMEDRIVER_VERSION=$(cat chromedriver-latest-release.txt)

		# Detect if system is 64 bits or 32 bits
		if [ $(uname -m) == 'x86_64' ]; then
			wget https://chromedriver.storage.googleapis.com/$LATEST_CHROMEDRIVER_VERSION/chromedriver_linux64.zip -O chrome-driver-latest.zip
		else
			wget https://chromedriver.storage.googleapis.com/$LATEST_CHROMEDRIVER_VERSION/chromedriver_linux32.zip -O chrome-driver-latest.zip
		fi
		unzip chrome-driver-latest.zip
		rm chrome-driver-latest.zip
	fi

	# Downloading prerequisites (Requests, Selenium)
	if [ ! $(command -v pip) ]; then
		curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
		python get-pip.py
	fi

	sudo pip install requests
	sudo pip install selenium
fi

#--------------------------
# Getting activation code
#--------------------------
ACTIVATION=$(python audible-activator-feature_login_as_arg/audible-activator.py --user $LOGIN --password $PASSWORD | tail -1)

#--------------------------
# Converting files
#--------------------------
bash AAXtoMP3-master/AAXtoMP3 $ACTIVATION $FILES
