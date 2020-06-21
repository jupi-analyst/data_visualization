install.packages('ggmap')
library(ggmap)
setwd("c:/rja")
childrisk <- read.csv("아산시_유치원구역.csv",header=T)
childrisk2 <- read.csv("아산시_초등학교구역.csv",header=T)
head(childrisk)
head(childrisk2)
gmap <- get_map('Asan-si office',zoom=13,maptype='roadmap')
gomap <- ggmap(gmap)+geom_point(data=childrisk, aes(x=childrisk$경도 , y=childrisk$위도 ),size=2,
                  alpha=.5,color="red")+ geom_point(data=childrisk2, 
              aes(x=childrisk2$경도 , y=childrisk2$위도),color="dark blue",size=1,alpha=.5)
gomap

