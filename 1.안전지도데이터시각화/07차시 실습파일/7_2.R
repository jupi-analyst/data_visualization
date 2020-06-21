install.packages('ggmap')
library(ggmap)
setwd("c:/rja")
cctv <- read.csv("서울노원구_cctv.csv",header=T)
head(cctv)

gmap <- get_map('Nowon-gu office',zoom=13,maptype='roadmap')
gomap <- ggmap(gmap)+geom_point(data=cctv, aes(x=cctv$경도 , y=cctv$위도 ),size=2,
                  alpha=.5,color="red")
gomap
