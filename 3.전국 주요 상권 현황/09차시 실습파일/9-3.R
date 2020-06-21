# if
feeling = function(x) {
  if(x>=0){
    x = "»ç¶û"
    return(x)
  }else{
    x = "ÀÌº°"
    return(x)
  }
}

feeling(5)
feeling(0)
feeling(-3)

# for
for(i in 1:5){
  print(i)
}

just <- function(x){
  for(i in 1:x){
    print(i)
  }
}
just(10)
view
data()
Nile
plot(Nile)
qRows <- data.frame( RowQuery = character(0), "BackTest P&L" = character(0), stringsAsFactors=FALSE)
qRows[nrow(qRows) + 1, ] <- c("@sp500(vwpc) | rsi(30) | qcume",  "12%")
View(qRows)
