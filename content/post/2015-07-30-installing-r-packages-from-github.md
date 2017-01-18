---
author: Rodney J. Dyer
date: 2015-07-30
layout: post
title: Installing R packages from github
permalink: https://dyerlab.bio.vcu.edu/2015/07/30/installing-r-packages-from-github/index.html
post_id: 567
categories: 
- Code
- Tutorials
---
The default CRAN repository is not the only place that R packages are stored.  You can also find them on github.  When I develop libraries for R, I typically develop them on 
[http://github.com/dyerlab](http://github.com/dyerlab) and then upload them to CRAN when I get to major milestones.  The latest versions of all my software will always be found on github.  So here is how to install packages directly.
more
To install from github directly, you need two things, the devtools library and the repository and project name on github that you'll be installing from.  As always, it is a great idea to update everything (latest version of R and packages via 
update.packages(ask=FALSE)) before you start.*In R, type 
install.packages("devtools") and it will go grab the stuff for you.  If you are on a machine that does not have compilers and other developers tools on it, R will tell you to go download the RTools package and install it.  They give you a URL to follow and a function to test the installation with.  Use it.
	
*require(devtools)
	
*Assuming you are using my account (dyerlab) and installing the gstudio package, you would then type: 
install_github("dyerlab/gstudio").
	
*Done.
