---
author: Rodney J. Dyer
date: 2013-06-03
layout: post
title: Updating R and With Current Libraries
permalink: https://dyerlab.bio.vcu.edu/2013/06/03/updating-r-and-with-current-libraries/index.html
post_id: 290
categories: 
- Code
- R
- Tutorials
---
If you work in R for very long on mac, there comes a time when you upgrade and the framework process looses all your libraries!  In some sense this is pretty lame because you now have to install all these libraries again.  However, it can be a blessing if you install packages in a willy-nilly fashion as you will only reinstall the ones you use most often.  At any rate, it is kind of a pain.  Here is what I’ve been doing about this to automate the process.  The key here is that you need to do the first part 
 you upgrade.#Current Library
In the old version of R, prior to updating you’ll want to save the libraries that you have installed.  In R, this can be done as follows:
pkgs <- installed.packages()
pkgs <- names( is.na(pkgs[,4]))
save(pkgs,file=’~/Desktop/pkgs.rda’)
 
#Install Updated R Version
Either download the latest package or update your svn repository and rebuild R and install it.  There are a lot of options for learning more about these options elsewhere on the web.
#Install Missing Packages
Now, in the new version of R, you can figure out which are installed by default and then take the differences from what you have and what the previous version had installed and then install them.
new_pkgs <- installed.packages()
new_pkgs <- names( is.na(new_pkgs[,4]))
load(“~/Desktop/pkgs.rda”)
to_install <- setdiff( pkgs, new_pkgs )
install.packages( to_install )
update.packages()
 
And you should be done.
