---
author: Rodney J. Dyer
date: 2016-04-15
layout: post
title: New Package - dlab
permalink: https://dyerlab.bio.vcu.edu/2016/04/15/new-plugin-dlab/index.html
post_id: 915
categories: 
- Code
---
I just uploaded a new plugin for RStudio called dlab.  I'll be migrating over all the little helper functions I use to this as a general require() on startup.  What it has now is an AddIn that allows you to select text and have it wrapped in the r-code markup.  I'm moving stuff between ePub and Markdown and it was needed.
You can install it as:devtools::install_github("dyerlab/dlab")
then look at the AddIns menu for wrapCode.
