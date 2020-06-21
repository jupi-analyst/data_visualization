setwd("c:/rja")
#엑셀 파일 불러오기
install.packages("xlsx")
library(xlsx)
edata <- read.xlsx("etest.xlsx",1)
edata
Encoding(edata)
repair_encoding(edata)
help(repair_encoding())
1. xlsx 파일에서 데이터 불러오기 :   xlsx 패키지를 설치하여 read.xlsx() 함수를 사용한다.
library(KoNLP)
ex) install.packages("xlsx")
localeToCharset()
library(xslx)
# 첫번째 시트를 읽도록 지정한다.
data <- read.xlsx("test.xlsx", 1)

# 특정 시트를 읽도록 한다.
data <- read.xlsx("test.xlsx", sheetIndex=2)
data <- read.xlsx("test.xlsx", sheetName="test")

2. xls 파일(97~2000 방식)에서 데이터 불러오기 : gdata 패키지를 설치하여 read.xls() 함수를 사용한다.

ex) install.packages("gdata")

library(gdata)
# 자동으로 첫번째 시트를 읽는다.
data <- read.xls("test.xls")

# 특정 시트를 읽도록 지정한다.
data <- read.xls("test.xls", sheet=2)
