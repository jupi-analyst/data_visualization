install.packages('ggmap')
library(ggmap)
setwd("c:/rja")
cctv <- read.csv("서울노원구cctv.csv",header=T)
cctv
geocode('korea',source = 'google')

qmap('seoul',zoom=12,maptype='roadmap')
qmap('seoul',zoom=12,maptype='terrain')
qmap('seoul',zoom=12,maptype='satellite')
qmap('seoul',zoom=12,maptype='hybrid')

gmap <- get_map('seoul',zoom=12,maptype='roadmap')
gomap <- ggmap(gmap)+geom_point(data=cctv, aes(x=LON, y=LAT),size=2,
                  alpha=.5,color="")
gomap
