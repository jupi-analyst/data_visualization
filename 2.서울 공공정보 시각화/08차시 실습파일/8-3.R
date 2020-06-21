setwd("c:/rja")
library(ggmap)

seoultour = read.csv("서울여행지.csv",header=T)
seoultour
seoultour1 = get_map("BONGwoN-DONG",zoom=13,maptype = "roadmap")
seoulmap = ggmap(seoultour1)+geom_point(data=seoultour,
                                        aes(x=seoultour$경도,y=seoultour$위도 ),
                                        size=3,alpha=0.8,col="dark red")

seoulmap
#geom_path 함수는 경로를 선으로 연결해서 표시한다.
seoulmap + geom_path(data=seoultour,aes(x=seoultour$경도 ,y=seoultour$위도 ),size=1,linetype=2,col="red")+
             geom_text(data=seoultour, aes(x=seoultour$경도 ,y=seoultour$위도, label=여행지),size=5)
