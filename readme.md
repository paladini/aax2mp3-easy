
[![Snap Status](https://build.snapcraft.io/badge/kz6fittycent/aax2mp3-easy.svg)](https://build.snapcraft.io/user/kz6fittycent/aax2mp3-easy)

# aax2mp3_easy
<br/>
<p align="center">
  <img src="https://i.imgur.com/166yX8Z.jpg"/>
  <br/>
  <b>Convert Audible AAX files (.aax) to MP3 (.mp3) with no effort.</b>
</p>

In short, `aax2mp3_easy` automates the two-step process that [AAXtoMP3](https://github.com/KrumpetPirate/AAXtoMP3) requires to convert files, this way you just need to run a single script that you make everything for you (including install all dependencies).

Based on [a fork from Audible Activator](https://github.com/paladini/audible-activator/)\* and [AAXtoMP3](https://github.com/KrumpetPirate/AAXtoMP3), this script provide an easier way to convert Audible AAX files to MP3.

## How to Use

In order to convert Audible AAX files to any other format it's needed an "Activation Code" from your Audible account. This activation code is used to break Audible DRM and to convert your audiobooks into MP3 files. Currently there's no other way to convert Audible AAX files without an activation code, as you can see [here](https://apple.stackexchange.com/questions/222917/how-do-i-use-ffmpeg-to-convert-audible-files) and [here](https://ffmpeg.org/ffmpeg-all.html#Audible-AAX).

**1 Step)** First of all, download this script and set it as executable:

```
wget https://github.com/paladini/aax2mp3-easy/archive/master.zip
unzip master.zip
cd aax2mp3-easy-master/
chmod +x aax2mp3_easy.sh
```

**2 Step)** Suppose that you login to Audible using `edward@gmail.com` with the password `hpK1abc`. To convert, let's say, `TheFilterBubble.aax` to a MP3 file, run the following:

```
./aax2mp3_easy.sh edward@gmail.com hpK1abc TheFilterBubble.aax
```

**3 Step)** The process itself can take a while, because dependencies has to be downloaded and Audible Activator needs to login to your account and check out what's the correct activation code for your account. While this happens a browser should appear - just ignore and wait for the process to finish; the browser will be automatically closed in the end.

After getting your activation code, the script will start converting TheFilterBubble.aax to a MP3 file, that will be located inside a folder called `Audiobooks` in the `aax2mp3_easy` folder. Check out this folder and you'll find your audiobook converted to .mp3 with an awesome cover. 


## Roadmap

- Reorganize project structure.
- Support for MacOS.

## Notes
\* *The forked version of Audible Activator is used by this project because I have to implement a version of this program where you can pass Audible username and password as command line arguments. This new feature I've implemented was not accepted by the creator of Audible Activator until now. If the maintener of this project accept my Pull Request I'll start using it instead of my own fork.*
