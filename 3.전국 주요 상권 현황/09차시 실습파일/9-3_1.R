install.packages("fmsb")
library(fmsb)
radar <- function(x){
  if(x==1){
    data = data.frame(5,10,5,7.5,2) #강남
    return(data)
  }else if(x==2){
    data = data.frame(2,8,5,12,9) #마포
    return(data)
  }else{
    data = data.frame(8,14,3,9.5,17) #종로
    return(data)
  }
}
radar(1)
radar(2)
radar(3)

par(mfrow=c(2,2))
for(i in 1:3){
  p = radar(i)
  print(p)
  colnames(p)=c("매출증감률" , "공급대비수요" , "점포별매출편차" , "상권매출규모" , "월별매출편차")
  datap=rbind(rep(20,10) , rep(0,10) , p)
  if(i==1){
    col="dark red"
    main="예비창업자평가상권-강남"
  }else if(i==2){
    col="dark green"
    main="예비창업자평가상권-마포"
  }else{
    col="dark Violet"
    main="예비창업자평가상권-종로"
  }
  radarchart(datap,axistype=1,seg=5,pcol=col,plty=2,title=main)
}






