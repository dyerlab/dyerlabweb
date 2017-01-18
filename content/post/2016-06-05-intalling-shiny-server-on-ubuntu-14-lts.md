---
author: Rodney J. Dyer
date: 2016-06-05
layout: post
title: Intalling Shiny Server on Ubuntu 14 LTS
permalink: https://dyerlab.bio.vcu.edu/2016/06/05/intalling-shiny-server-on-ubuntu-14-lts/index.html
post_id: 972
categories: 
- Code
- Documents
- R
- servers
- software
- Tutorials
---
OK, so I just '
[found](http://shiny.rstudio.com)' shiny and it has a lot of cool stuff to it.  OK, I've known about it for a long time but have just had the opportunity to sit down and work it out and see how it can fit into the presentation and learning I'm trying to develop in my 
[Applied Population Genetics](http://popgen.bio.vcu.edu) online textbook.  Here is a brief overview of how I set up the shiny server on my Ubuntu box that is hosting the book (so I can embed more interactivity in the display).
more
OK, below are the steps that I'm taking to upgrade everything on the box and install the shiny server app and start hosting individual shiny apps.##Updating Background & Installing Necessary Components
First, you should update to the latest releases.  I'm running a LTS version (long-term support) so it is pretty stark.
sudo apt-get update
sudo apt-get upgrade
Next, I needed to install the following development libraries so that things will go easily.
sudo apt-get install libssl-dev
sudo apt-get install gdebi-core
sudo su - -c "R -e \"install.packages('devtools', repos='http://cran.rstudio.com/')\""
And then we can use the 
gdebi  framework to install the the server
wget https://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.4.2.786-amd64.deb
sudo gdebi shiny-server-1.4.2.786-amd64.deb
This puts the conf file in 
/etc/init/shiny-server.conf , sets up the user 
shiny  (and has a home directory), and starts the shiny-server process.
##Redirecting URL Requests
At this point the shiny-server is running and is servubg pages on port 3838.  However, I block all ports other than 22 and 80 for security, so what I want to do is to redirect requests to my server asking for anything in the subdirectory 
[http://popgen.bio.vcu.edu/shiny](http://popgen.bio.vcu.edu/shiny/) to redirect to 
[http://127.0.0.1:3838](http://127.0.0.1:3838/) locally.  I need to do this by fiddling with the Apache configuration scripts.
Apache on Ubuntu puts configuration scripts in /etc/apache2/sites-available and symliks them to /etc/apache2/sites-enabled.  In this file, I set up a proxy pass so that any url that is asking for stuff in the /shiny/ subdirectory be redirected to the 3838 port on this machine.  At the end of the section for this server, enclosed in 
<VirtualHost <i>:80> 
, I put the following in:
RewriteCond %{HTTP:Upgrade} =websocket
RewriteRule /shiny/(.*) ws://localhost:3838/$1 [P,L]
RewriteCond %{HTTP:Upgrade} !=websocket
RewriteRule /shiny/(.*) http://localhost:3838/$1 [P,L]
ProxyPass /shiny/ http://localhost:3838/        
ProxyPassReverse /shiny/ http://localhost:3838/
You need to make sure that the following mod are turned on for apache:
*mod_proxy
 	
*mod_proxy_html
 	
*mod_proxy_wstunnel
Enable them the way that is appropriate for your server.  On Ubuntu it is:
a2enmod mod_proxy
a2enmod mod_proxy_html
a2enmod mod_proxy_wstunnel
##Restart Apache
All that is left to do now is restart apache and check to see the startup screen for all shiny apps on the 
[http://popgen.bio.vcu.edu/shiny/](http://popgen.bio.vcu.edu/shiny/) page.
sudo service apache2 restart
The first shiny app to be integrated into the Applied Population Genetics textbook is located in the Hardy-Weinberg chapter.  It is embedded as:
And creates the following widget in the book (go ahead and play with it, it is interactive):
This opens a whole slew of interactive graphics for the textbook!
