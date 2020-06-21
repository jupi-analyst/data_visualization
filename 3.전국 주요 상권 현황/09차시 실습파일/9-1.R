setwd("c:/rja")
store = read.csv("상권분석.csv", 
                 sep = ",",
                 header = T) 
store
#각 행번호를 지역명으로 변경함 
row.names(store) = store$지역
store = store[,2:6]

store

stars(store,flip.labels=FALSE,draw.segment=FALSE,frame.plot=TRUE,full=TRUE,
      main="전국상권분석 -STAR Chart" )
stars(store,flip.labels=FALSE,draw.segment=TRUE,frame.plot=FALSE,full=FALSE,
      main="전국상권분석 -나이팅게일 Chart" )

