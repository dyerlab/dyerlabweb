---
author: Rodney J. Dyer
date: 2015-09-04
layout: post
title: Installing Gitbook on OSX
permalink: https://dyerlab.bio.vcu.edu/2015/09/04/installing-gitbook-on-osx/index.html
post_id: 639
categories: 
- Uncategorized
---
I am in various stages of writing technical texts using R/RStudio/knitr and have been looking for some methods that help in this process.  My goals are to be able to:*Maintain a single source tree that can produce the text (including graphics, statistical analyses, etc). easily
	
*Be able to produce high quality typesetting
	
*Be able to easily make epub
	
*Include both Code and output in the text.
I've just run across Gitbook and it looks like a good option, particularly with the help of the R package Rgitbook.   Here is a bit of work that I had to do to get things going on my machine.
more
You will need to make sure you have XCode installed (get it from Apple) for all the building tools.  If you've had previous versions of XCode on your machine, you may need to reset 
xcode-select  as:
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer/
*Download Node.js from their 
[site](https://nodejs.org/en/).
	
*In R, install 
devtools  and then 
require("devtools")  and 
install_github("jbryer/Rgitbook")
	
*Try to install it as per the instruction here.  If this doesn't help, what I had to do was:
*Try 
sudo npm install gitbook -g
	
*If this fails, you need to clean the npm cache and figure out what the problems were.  Depending upon your error message you may need to:
*Clean up any locks:
sudo chown -R $(whoami) ~/.npm/_locks
	
*Clean the cache
sudo npm cache clean
	
*Then install 
sudo npm install gitbook-plugins -g  and 
sudo npm install gitbook-cli -g  and you should be good.
	
*You should be able to go to R and 
require(Rgitbook)  and then 
checkForGitbook()  and get normal feedback.
Now you have it installed, you should go see 
[http://jason.bryer.org/Rgitbook/](http://jason.bryer.org/Rgitbook/) for how to use it.  Good luck!  It seems like this R package hasn't been updated in a while.  I hope it isn't stale, it looks pretty interesting.
