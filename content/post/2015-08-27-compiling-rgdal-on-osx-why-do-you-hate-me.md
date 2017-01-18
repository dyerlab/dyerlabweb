---
author: Rodney J. Dyer
date: 2015-08-27
layout: post
title: Compiling RGDAL on OSX - Why do you hate me?
permalink: https://dyerlab.bio.vcu.edu/2015/08/27/compiling-rgdal-on-osx-why-do-you-hate-me/index.html
post_id: 622
categories: 
- Code
---
Every time I upgrade in any significant way, two R libraries seem to raise their ugly heads and scream like a spoiled child—
rgdal and 
rgeos .  Why do these two have to be SOOOO much of a pain?  Why can't we have a auto build of a binary with all the options in it for OSX?  Who knows?  I always feel like I get the fuzzy end of the lollipop with these two.  Here is my latest approach for getting them going.
moreFirst you have to make sure you have the latest GDAL libraries.  I used to get mine from 
[Kyngchaos](http://www.kyngchaos.com/software/frameworks), just download the framework, install it, and then do some kind of long 
R CMD INSTALL  dance, which seems to no longer work for me.  I also tried installing from Ripley's repository and found that (a) It was a version older than the one I already had on my machine, and (b) you can't install from that repository , there is a malformed header and the 
install.packages()  function just barfs.
Time to try something new.  I typically stay away from the various installer frameworks out there on OSX to keep everything in Frameworks.  But this time, I used MacPorts.  You can find the latest version 
[here](http://www.macports.org/).  Here is how I got it to help me out.*Downloaded the version for my OS, I'm currently on 10.10 and installed it.
	
*In the terminal, I updated it 
sudo port -v selfupdate
	
*I then used it to install gdal as a unix library (rather than as a framework so it won't be located in /Library/Frameworks) by 
sudo port install gdal.  There were 
**a lot**
 of dependencies for this one so it took a while.
	
*I then had R install rgdal as 
install.packages( rgdal, type="source")
	
*Worked like a charm.
