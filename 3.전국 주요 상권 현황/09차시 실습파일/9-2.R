install.packages("fmsb")
library(fmsb)
data = data.frame(5,10,5,7.5,2)
data
colnames(data)=c("매출증감률" , "공급대비수요" , 
                 "점포별매출편차" , "상권매출규모" ,
                 "월별매출편차")
data=rbind(rep(20,5) , rep(0,5) , data)
data
  radarchart(data,axistype=1,seg=5,pcol="red",
             plty=2,title="예비창업자평가상권")
  
  radarchart( data  , axistype=1 , title="예비창업자평가상권",
              #도형의 선색 과 채우기 색상 
              pcol=rgb(0.6,0.5,0.5,0.9) , 
              pfcol=rgb(0.2,0.5,0.5,0.5) , plwd=3 , 
              #레이더 차트 색상 
              cglcol="grey", cglty=1, axislabcol="grey", 
              caxislabels=seq(0,20,5), cglwd=0.9,
              #라벨 글자 크기 
              vlcex=0.8
  )
  
  