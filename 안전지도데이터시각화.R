install.packages("ggmap")
install.packages("xlsx")
library(ggmap)
library(xlsx)
library(tidyverse)
register_google(key = "AIzaSyDmLduhIwB5hO3r-E4BFmi_wmrk-tbQg0Y") # 구글 API
getwd()
cctv = read.csv("./data/서울노원구_cctv.csv", header = T, fileEncoding = 'euc-kr')
head(cctv)
gmap <- get_googlemap('Nowon-gu office', zoom = 13, maptype = 'roadmap')
ggmap(gmap) + geom_point(data = cctv, aes(x = cctv$경도, y = cctv$위도), 
                         size = 2, alpha = 0.5, color = 'red')

#아산 어린이집 위치
childrisk = read.csv("./data/서울서초구_어린이보호구역.csv", header = T, fileEncoding = 'euc-kr')
head(childrisk)
gmap <- get_googlemap('Seocho-gu office', zoom = 13, mamtype = 'roadmap')
gomap <- ggmap(gmap) +
  geom_point(data = childrisk,
             aes(x = childrisk$경도, y = childrisk$위도),
             size = 2,
             alpha = 5, color = 'red')
gomap
gomap + geom_text(data = childrisk,
                  aes(x = childrisk$경도, y = childrisk$위도+0.01),
                  label = childrisk$대상시설명,
                  size = 2,
                  family = "AppleGothic")

# 유치원,어린이집 / 초등학교 구별
childrisk_new <- childrisk %>% 
  filter(childrisk$시설종류 == c('어린이집', '유치원'))
head(childrisk_new)
childrisk_new2 <- childrisk %>% 
  filter(childrisk$시설종류 == '초등학교')
head(childrisk_new2)

gmap <- get_googlemap('Seocho-gu office', zoom = 13, mamtype = 'roadmap')
gomap <- ggmap(gmap) +
  geom_point(data = childrisk_new,
             aes(x = childrisk_new$경도, y = childrisk_new$위도),
             size = 2,
             alpha = 5, color = 'red') +
  geom_point(data = childrisk_new2,
             aes(x = childrisk_new2$경도, y = childrisk_new2$위도),
             size = 1,
             alpha = 5, color = 'blue')
gomap
