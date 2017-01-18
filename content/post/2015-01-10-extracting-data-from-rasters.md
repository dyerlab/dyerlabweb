---
author: Rodney J. Dyer
date: 2015-01-10
layout: post
title: Extracting Data from Rasters
permalink: https://dyerlab.bio.vcu.edu/2015/01/10/extracting-data-from-rasters/index.html
post_id: 278
categories: 
- Araptus attenuata
- Baja California
- Code
- ggplot2
- R
- raster
- Tutorials
---
This document shows you how to extract data from rasters.
## Getting The Libraries

First, I'll load in some packages to get the ability to work with raster data and to load in the *Arapatus attenuatus* data set (it is part of the default **gstudio** package).

require(raster)
require(gstudio)
 
##
##Loading and Cropping Rasters
We can load in the raster, and then crop it to just the are we need. These rasters were downloaded from [
[http://www.worldclim.org](http://www.worldclim.org/)] and are much larger than the study area. This just makes it easier on the computer to not have to deal with such large areas. After cropping it, we will load in the annual precip and temperature data as well.
tmp <- raster("alt_22.bil")
e <- extent(c(-115, -109, 22, 30))
baja_alt <- crop(tmp, e)
baja_temp <- crop(raster("bio1_22.bil"), e)
baja_prec <- crop(raster("bio12_22.bil"), e)
 
##
##Getting Example Data from 
Araptus attenuatus
Now, lets grab the 
Araptus data and look at the data and plot out the locations.
data(arapat)
summary(arapat)
 
##    Species      Cluster      Population        ID         Latitude   
##  CladeA: 75   CBP-C :150   32     : 19   101_10A:  1   Min.   :23.1  
##  CladeB: 36   NBP-C : 84   75     : 11   101_1A :  1   1st Qu.:24.6  
##  CladeC:252   SBP-C : 18   Const  : 11   101_2A :  1   Median :26.2  
##               SCBP-A: 75   12     : 10   101_3A :  1   Mean   :26.3  
##               SON-B : 36   153    : 10   101_4A :  1   3rd Qu.:27.5  
##                            157    : 10   101_5A :  1   Max.   :29.3  
##                            (Other):292   (Other):357                 
##    Longitude       LTRS          WNT            EN          EF     
##  Min.   :-114   01:01:147   03:03  :108   01:01  :225        :  2  
##  1st Qu.:-113   01:02: 86   01:01  : 82   01:02  : 52   01:01:219  
##  Median :-112   02:02:130   01:03  : 77   02:02  : 38   01:02: 52  
##  Mean   :-112               02:02  : 62   03:03  : 22   02:02: 90  
##  3rd Qu.:-110                      : 11   01:03  :  7              
##  Max.   :-109               03:04  :  8   03:04  :  6              
##                             (Other): 15   (Other): 13              
##     ZMP           AML           ATPS          MP20    
##       : 33   08:08  : 51   05:05  :155   05:07  : 64  
##  01:01: 46   07:07  : 42   03:03  : 69   07:07  : 53  
##  01:02: 51   07:08  : 42   09:09  : 66   18:18  : 52  
##  02:02:233   04:04  : 41   02:02  : 30   05:05  : 48  
##                     : 23   07:09  : 14   05:06  : 22  
##              07:09  : 22   08:08  :  9   11:11  : 12  
##              (Other):142   (Other): 20   (Other):112
 
plot(arapat, zoom = 6)
![png-3](http://dyerlab.bio.vcu.edu/wp-content/uploads/sites/4831/2015/01/png-3.png)
##Extracting Point Data
To elevation, temperature and precipitation from the rasters for each sampling location, we need to translate them into points first. I'll first grab the coordinate data as a 
data.frame.
coords <- StrataCoordinates(arapat)
 
Then we can grab them using the normal functions in the 
**sp**
 library.
pts <- SpatialPoints(coords[, 2:3])
coords$elev <- extract(baja_alt, pts)
coords$temp <- extract(baja_temp, pts)
coords$prec <- extract(baja_prec, pts)
coords
 
##     Strata Longitude Latitude elev temp prec
## 1       88    -114.3    29.33  681  178  143
## 11       9    -113.9    29.01  361  195  148
## 20      84    -113.7    28.97  368  197  124
## 29     175    -113.5    28.73  240  205  106
## 36     177    -114.0    28.66  177  203  120
## 46     173    -112.9    28.41   26  223  102
## 56     171    -113.2    28.22  522  195  145
## 66      89    -113.4    28.04  290  203  117
## 76     159    -113.3    27.53   87  211  123
## 85     SFr    -113.0    27.36  305  205  107
## 94     160    -112.5    27.40  371  212  124
## 104    162    -112.4    27.20  248  220  119
## 114     12    -112.7    27.18  488  202  130
## 124    161    -113.0    27.04   29  216   91
## 134     93    -112.0    26.95   66  230   81
## 144    165    -112.4    26.25   NA   NA   NA
## 154    169    -111.4    26.21    6  238  134
## 164     58    -111.4    26.02   12  240  129
## 173    166    -112.1    25.91   70  224   84
## 183     64    -111.3    25.61  397  214  245
## 188    168    -111.2    25.56  354  217  235
## 198     51    -111.6    25.35   80  222  140
## 205  Const    -111.7    25.02   50  217  127
## 216     77    -110.7    24.88   52  231  193
## 226    164    -111.5    24.75   35  213   95
## 236     75    -110.7    24.59   21  231  166
## 247    163    -111.0    24.21  196  219  127
## 257   ESan    -110.4    24.46    9  237  175
## 265    153    -110.5    24.13   31  235  165
## 275     48    -110.3    24.21  117  233  217
## 285    156    -110.0    24.04    0  237  196
## 291    157    -110.1    24.02  609  208  443
## 301     73    -109.9    24.01  103  233  227
## 311    Aqu    -110.1    23.29  142  226  227
## 319    Mat    -110.1    23.09    5  234  159
## 324     98    -109.6    23.08   75  237  233
## 328    101    -110.6    27.91    8  249  244
## 337     32    -109.3    26.64   18  244  337
## 356    102    -109.1    26.38   10  245  346
 
##
##Plotting Trend lines.
Cool, lets sort this by latitude
coords <- coords[order(coords$Latitude), ]
 
and then plot out some values to look at what is going on.
require(ggplot2)
ggplot(coords, aes(x = Latitude, y = elev)) + geom_line(color = "gray") + theme_bw() + geom_text(aes(y = elev + 10, label = Strata), color = "blue")
![png](http://rampages.us/dyerlab/wp-content/uploads/sites/4831/2015/01/png.png)
 
ggplot(coords, aes(x = Latitude, y = temp)) + geom_line(color = "gray") + theme_bw() + geom_text(aes(y = temp + 5, label = Strata), color = "blue")
[![png-1](http://rampages.us/dyerlab/wp-content/uploads/sites/4831/2015/01/png-1.png)](http://rampages.us/dyerlab/wp-content/uploads/sites/4831/2015/01/png-1.png)
ggplot(coords, aes(x = Latitude, y = prec)) + geom_line(color = "gray") + theme_bw() + geom_text(aes(y = prec + 10, label = Strata), color = "blue")
 
[![png-2](http://rampages.us/dyerlab/wp-content/uploads/sites/4831/2015/01/png-2.png)](http://rampages.us/dyerlab/wp-content/uploads/sites/4831/2015/01/png-2.png)
