install.packages('ggmap')
library(ggmap)
setwd("c:/rja")
childrisk <- read.csv("아산시_어린이보호구역.csv",header=T)
head(childrisk)

gmap <- get_map('Asan-si office',zoom=13,maptype='roadmap')
gomap <- ggmap(gmap)+geom_point(data=childrisk, aes(x=childrisk$경도 , y=childrisk$위도 ),size=2,
                  alpha=.5,color="red")
gomap

gomap + geom_text(data=childrisk, aes(x = childrisk$경도, y = childrisk$위도+0.01, 
                                      label=childrisk$대상시설명),size=2)

