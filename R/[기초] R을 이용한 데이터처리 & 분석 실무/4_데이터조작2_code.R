library(sqldf)
library(plyr)
library(reshape2)
library(data.table)
library(foreach)
library(doParallel)
library(testthat)

head(french_fries, 2)
m <- melt(french_fries, id.vars = 1:4)
#   time treatment subject rep variable value
# 1    1         1       3   1   potato   2.9
# 2    1         1       3   2   potato  14.0
head(m, 2)

r <- dcast(m, time + treatment + subject + rep ~ ...)
head(r,2)

# 두 데이터가 완전히 동일한 객체인지 확인
identical(r, french_fries)  # FALSE
rownames(r) <- NULL  # r에 특이하게 부여된 행번호 무시시
rownames(french_fries) <- NULL  # french_fries에 특이하게 부여된 행번호 무시시

identical(r, french_fries)  # TRUE

#### ...데이터요약 ####
# cast(): 데이터의 요약값 계산 가능