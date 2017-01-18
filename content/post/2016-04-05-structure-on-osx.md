---
author: Rodney J. Dyer
date: 2016-04-05
layout: post
title: STRUCTURE on OSX
permalink: https://dyerlab.bio.vcu.edu/2016/04/05/structure-on-osx/index.html
post_id: 880
categories: 
- Applied Population Genetics
- Code
- Population Genetics
- Tutorials
---
The program STRUCTURE is an ubiquitous feature of many population genetic studies these days—if it is appropriate is another question. Today, while covering model based clustering in population genetics, we ran into a problem where STRUCTURE was unable to run and the OS said it was Corrupted and should be thrown away.  Jump below for our fix, it really is an easy one.
more
The most recent version of the GUI STRUCTURE java package dates from 2012.  This is getting a bit long in the tooth, but when teaching it is not that far fetched to have aged laptops...
The error we were running into is the prompted with the following dialog box when attempting to start the program.
![Screen Shot 2016-04-05 at 2.46.30 PM](http://dyerlab.bio.vcu.edu/wp-content/uploads/sites/4831/2016/04/Screen-Shot-2016-04-05-at-2.46.30-PM-1024x380.png)
As it turns out, sometime between 2012 and now, OSX has moved towards digitally signing applications and in this case, it is not that it is "damaged" it just won't allow the Java Runtime to run it unless we make a small change in the preferences panel and select the Security & Privacy option.
![Screen Shot 2016-04-05 at 2.48.22 PM](http://dyerlab.bio.vcu.edu/wp-content/uploads/sites/4831/2016/04/Screen-Shot-2016-04-05-at-2.48.22-PM-142x150.png)
Then authenticate on the bottom by clicking on the lock and entering your password.
![Screen Shot 2016-04-05 at 2.48.00 PM](http://dyerlab.bio.vcu.edu/wp-content/uploads/sites/4831/2016/04/Screen-Shot-2016-04-05-at-2.48.00-PM-300x74.png)
Now, change the setting on the Allow apps downloaded from to the Anywhere option.
![Screen Shot 2016-04-05 at 2.49.36 PM](http://dyerlab.bio.vcu.edu/wp-content/uploads/sites/4831/2016/04/Screen-Shot-2016-04-05-at-2.49.36-PM-300x98.png)
This should allow you to start STRUCTURE and run it.  Do that and then close it.  Go back to the System Preferences and turn it back to what you had it before.
![Screen Shot 2016-04-05 at 2.51.22 PM](http://dyerlab.bio.vcu.edu/wp-content/uploads/sites/4831/2016/04/Screen-Shot-2016-04-05-at-2.51.22-PM-300x101.png)
Once you run it once, you will be able to run it again without lowering your security. Happy clustering!
