---
author: Rodney J. Dyer
date: 2015-07-29
layout: post
title: Compiling the GSL Library for OSX
permalink: https://dyerlab.bio.vcu.edu/2015/07/29/compiling-the-gsl-library-for-osx/index.html
post_id: 544
categories: 
- Code
- gene flow
- gsl
- population graphs
- Tutorials
- xcode
---
I've been working on integrating the Swift language into my analysis workflow but much of what I do involves the GNU Scientific Libraries for matrix analysis and other tools.  Here is a quick tutorial on how to install the GSL library on a clean OSX platform.*It is easiest if you have XCode installed.  You can get this from the App Store for free.  Go download it and install it.
	
*Download the latest version of the GSL libraries.  You can grab them by:
*Looking for your nearest mirror site listed at 
[http://www.gnu.org/prep/ftp.html](http://www.gnu.org/prep/ftp.html) and connecting to it.
	
*Open the directory 
gsl/ where all the versions will be listed.  Scroll down and grab 
gsl-latest.tar.gz.
	
*Open the terminal (Utilities -> Terminal.app) and type:  
cd ~/Downloads
	
*Unpack the archive by:  
tar zxvf gsl-latest.tar.gz then 
cd gsl-1.16/ (or whatever the version actually was, it will probably be some number larger than 1.16).
	
*Inside that folder will be a README file (which you probably won't read) and an INSTALL file (which you should read).  In that folder it will tell you to:  
./configure then  
make then 
sudo make install. This last command will require you to type in your password as it is going to install something into the base system.
	
*All the libraries and header files will be installed into the 
/usr/local/ directory.
