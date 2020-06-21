store <- read.csv('./data/상권분석.csv',
                  sep = ',',
                  header = T, fileEncoding = 'euc-kr')
store
row.names(store) = store$지역
store = store[, 2:6]
store

stars(store, flip.labels = FALSE, draw.segments = FALSE,
      frame.plot = TRUE, full = TRUE,
      main = '상권분석 ~STAR chart',
      family = 'AppleGothic')

stars(store, flip.labels = FALSE, 
      draw.segments = TRUE,
      frame.plot = TRUE, 
      full = FALSE,
      main = '상권분석 -나이팅게일 chart',
      family = 'AppleGothic')

## 예비창업가 평가상권
install.packages("fmsb")
library(fmsb)


df <- data.frame(5, 10, 5, 7.5, 2)
df
colnames(df) <- c("매출증감률", "공급대비수요", "점포별매출편차", "상권매출규모",
                  "월별매출편차")
df <- rbind(rep(20, 5), rep(0,5), df)
radarchart(df, 
           axistype = 1, 
           seg = 5, 
           pcol = 'red',
           plty = 2,
           title = '예비창업평가상권')

radarchart(df, 
           axistype = 1, 
           axislabcol = 'grey',
           seg = 5, 
           pcol = rgb(0.6, 0.5, 0.5, 0.9),
           pfcol = rgb(0.2, 0.5, 0.5, 0.5),
           plwd = 3,
           cglcol = "grey",
           cglty = 1,
           cglwd = 0.9,
           vlcex = 0.8,
           title = '예비창업평가상권')

radar <- function(x) {
  if(x == 1) {
    df <- data.frame(5, 10, 5, 7.5, 2) #강남
    return(df)
  }
  else if(x == 2) {
    df <- data.frame(2, 8, 5, 12, 9)
    return(df)
  }
  else {
    df <- data.frame(8, 14, 3, 9, 5, 17)
    return(df)
  }
}

radar(1)
radar(2)
radar(3)

par(mfrow = c(2, 2))
for(i in 1:3) {
  p <- radar(i)
  print(p)
  colnames(p) <- c("매출증감률", "공급대비수요", "점포별매출편차", "상권매출규모",
                  "월별매출편차")
  df_new <- rbind(rep(20, 10), rep(0, 10), p)
  
  #if elseiF는 다른 명령어 수행가능, ifelse문은 리턴값만 반환
  if(i == 1){
    col = "dark red"
    main = "강남"
  }
  
  else if(i == 2) {
    col = 'dark green'
    main = '마포'
  }
  
  else {
    col = 'dark violet'
    main = '종로'
  }
  radarchart(df_new, axistype = 1, seg = 5, pcol = col, plty = 2, title = main, 
             family = 'AppleGothic')
}
