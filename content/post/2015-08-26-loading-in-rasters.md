---
author: Rodney J. Dyer
date: 2015-08-26
layout: post
title: Loading in Rasters
permalink: https://dyerlab.bio.vcu.edu/2015/08/26/loading-in-rasters/index.html
post_id: 592
categories: 
- Code
- R
- spatial
- Tutorials
---
Much of the work in my laboratory uses spatial data in some context.  As such it is important to try to be able to grab and use spatial data to in an easy fashion.  At present, R is probably the best way to grab, visualize, and analyze spatial data. For this example, I went to 
[http://worldclim.org](http://worldclim.org) and downloaded the elevation (altitude) for tile 13 (eastern North America) as a GeoTiff.  A GeoTiff is a specific type of image format that has spatial data contained within it.  The tile data has a pixel resolution of 30 arc seconds which puts us in the general area of ~ 1km.   First, we need to get things set up to work.# Set the working directory to where you want it.
setwd("~/Downloads")
# load in the raster library
require(raster)
Loading required package: raster
Loading required package: sp
moreThen we can load in and visualize the data.
r <- raster("alt_13.tif")
plot(r)
![Rplot](http://dyerlab.bio.vcu.edu/wp-content/uploads/sites/4831/2015/08/Rplot.png)
We can see what the raster relates to by looking at the extent.
extent(r)
class       : Extent 
xmin        : -90 
xmax        : -60 
ymin        : 30 
ymax        : 60
or its contents.
print(r)
class       : RasterLayer 
dimensions  : 3600, 3600, 12960000  (nrow, ncol, ncell)
resolution  : 0.008333333, 0.008333333  (x, y)
extent      : -90, -60, 30, 60  (xmin, xmax, ymin, ymax)
coord. ref. : +proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0 
data source : /Users/rodney/Downloads/alt_13.tif 
names       : alt_13 
values      : -98, 1961  (min, max)
And you are off to the races.  This should get you going with the data.  Other posts you may be interested in looking at are found by 
[here](http://dyerlab.bio.vcu.edu/tag/r/).
