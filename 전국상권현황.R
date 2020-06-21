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
