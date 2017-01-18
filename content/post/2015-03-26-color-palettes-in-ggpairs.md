---
author: Rodney J. Dyer
date: 2015-03-26
layout: post
title: Color palettes in ggpairs
permalink: https://dyerlab.bio.vcu.edu/2015/03/26/color-palettes-in-ggpairs/index.html
post_id: 407
categories: 
- Code
---
Working on some code and was having a tough time configuring the color palette in GGally since it does not produce a ggplot object.  It appears to be a larger problem.  So, here is one hack, redefine the ggplot function and change the default palette there.  Need to make a dyerlab::palette now...ggplot <- function(...) ggplot2::ggplot(...) + scale_color_brewer(palette="Set1")
unlockBinding("ggplot",parent.env(asNamespace("GGally")))
assign("ggplot",ggplot,parent.env(asNamespace("GGally")))
require(GGally)
ggpairs(df,columns = 3:7,axisLabels="none",color="color")
