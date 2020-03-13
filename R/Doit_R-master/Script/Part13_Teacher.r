#### 13-1 기초 통계
## 대표값과 산포(변동성)
x <- runif(50, 1, 100)
x
hist(x)
y <- c(x, 1000)
y


mean(x)
mean(y)
median(x)
median(y)
sd(x)
sd(y)
range(x)
range(y)
IQR(x)
IQR(y)

boxplot(x)
boxplot(y)

install.packages('fBasics')
library(fBasics)
require(fBasics)
skewness(x)
skewness(y)
# - 추가학습: skewness와 boxcox 변환


## 2.0 다양한 분포함수
# binorm : 이항분포
# f: f분포
# geom: 기하분포
# hyper: 초기하분포
# nbinorm: 음이항분포
# pois: 프와송 분포
# t: t분포
# unif: 균등분포
# chisq 카이제곱분포
set.seed(123)

## 분포함수 : norm에 대해
# dnorm(x, mean = 0, sd = 1, log = FALSE): density
# pnorm(q, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE): probablilty
## - lower.tail = T: return P(x<q)    |   lower.tail = F: return P(x>q)
## - log.p = F: return Prob           |   log.p = T: return log(Prob)
# qnorm(p, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE): quantile
# rnorm(n, mean = 0, sd = 1): random generation n samples

# 평균이 0이고 표준편차가 10인 정규분포에서 100개의 난수 생성.
x <- rnorm(100, 0, 1)
hist(x, breaks=10)

plot(density(rnorm(1000000, 9, 10)))

# 평균이 0이고 표준편차가 1인 정규분포로부터:
pnorm(1)
pnorm(1, lower.tail = F)
pnorm(1, log.p = T)
exp(pnorm(1, log.p = T))

pnorm(1) - pnorm(-1)
pnorm(1.67) - pnorm(-1.67)
pnorm(1.96) - pnorm(-1.96)

pnorm(2)
pnorm(2) - pnorm(-2)

pnorm(3) - pnorm(-3)
pnorm(6) - pnorm(-6)

##- 소수점 k 자리까지의 정밀도를 1  ~ 22까지 표현가능하다. 기본값은 7.
specify_decimal <- function(x, k) trimws(format(round(x, k), nsmall=k))
specify_decimal(pnorm(6) - pnorm(-6), 10)


# density로 부터 두 값에 대한 분포확률(우도) 예측하기.
dnorm(1.1, 1.15, 1)*dnorm(1.2, 1.15, 1)
dnorm(1.1, 0.9, 1)*dnorm(1.2, 0.9, 1)


# 누적 확률이 0.9가 되는 x값을 찾아라.
q = qnorm(.9, 9, 10)
pnorm(q, 9, 10)
z = (qnorm(.9, 9, 10) - 9)/10
z
qnorm(.9, 0, 1)

(cps <- 1:9 / 10)
qs = qnorm(cps, 9, 10)
zs = (qs - 9)/10
pnorm(zs, 0, 1)

# N(9, 10) 분포에서 신뢰구간이 0.9가 되는 x를 찾아라.
tmp <- qnorm(0.05, 9, 10)
pnorm(9+9-tmp, 9, 10)
q = 18-tmp
z = (q-9)/10
pnorm(z, 0, 1)


## 프와송 분포: f(n, lambda)의 이해
# - 단위시간(단위공간)당 사건 발생 건수가 lambda일 때,
# - 단위시간 내, n번의 사건이 발생할 확률
dpois(1, 1.5) + ppois(0, 1.5)
ppois(1, 1.5)
ppois(3, 1.5)
qpois(0.9, 1.5)

dpois(3, 3)
dpois(3, 1)


# 단위시간당 1건 발생확률에서 0 ~ 5건까지 발생확률에 대한 누적합
sum = 0
for (i in 0:5){
  sum = sum + dpois(i, 1)
}
sum

# - 누적분포함수로 구하면:
ppois(5, 1)


## 이항분포
# - tv리모콘 문제: 채널 50에서 6번 눌렀을 때 채널 50.
# - 6C3 (1/2)^6
6*5*4/(3*2)*(0.5^6)
dbinom(3, 6, 0.5)


## 2.1 기초통계량
mean(1:10)
sd(1:10)
var(1:10)
# - 분산의 정의로부터: Var(x) = 1/(N-1) * sum[(x - mean(x))^2]
sum( (1:10 - mean(1:10))^2 ) / (10-1)


## 2.2 summay
# - 알고 보면 쉽게:
x <- 1:10
summary(x)
# - 알고 보면 쉽지 않다:
str(boxplot(x))
boxplot(x)$stats # data로부터 

# - 왜 다를까?
c(min(x), quantile(x, 1/4), median(x), quantile(x, 3/4), max(x))

IQR(x)
quantile(x, c(1/4, 3/4))
qt <- quantile(x, c(1/4, 3/4), names = F)
qt[2] - qt[1]


## 2.3 명목형 변수에 대한 최빈값(mode)
x <- factor(c("a", "b", "c", "c", "c", "d", "d"))
x
str(x)
table(x) # named vector
str(table(x))
which.max(table(x))
str(which.max(table(x))) # named vector: https://rpubs.com/sowmya21jan/338762

names(table(x))[which.max(table(x))]

summary(x)
str(summary(x))


#### 13-2 t- 검정: 평균의 차 검정 ####

## -------------------------------------------------------------------- ##
mpg <- as.data.frame(ggplot2::mpg)

library(dplyr)
mpg_diff <- mpg %>% 
  select(class, cty) %>% 
  filter(class %in% c("compact", "suv"))

head(mpg_diff)
table(mpg_diff$class)

t.test(data = mpg_diff, cty ~ class, var.equal = T)

test <- aov(cty ~ class, data = mpg)
summary(test)

## -------------------------------------------------------------------- ##
mpg_diff2 <- mpg %>% 
  select(fl, cty) %>% 
  filter(fl %in% c("r", "p"))  # r:regular, p:premium

table(mpg_diff2$fl)

t.test(data = mpg_diff2, cty ~ fl, var.equal = T)


#### 13-3 ####

## -------------------------------------------------------------------- ##
economics <- as.data.frame(ggplot2::economics)
cor.test(economics$unemploy, economics$pce)


## -------------------------------------------------------------------- ##
head(mtcars)
car_cor <- cor(mtcars)  # 상관행렬 생성
round(car_cor, 2)       # 소수점 셋째 자리에서 반올림해서 출력

install.packages("corrplot")
library(corrplot)

corrplot(car_cor)

corrplot(car_cor, method = "number")

col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))

corrplot(car_cor,
         method = "color",       # 색깔로 표현
         col = col(200),         # 색상 200개 선정
         type = "lower",         # 왼쪽 아래 행렬만 표시
         order = "hclust",       # 유사한 상관계수끼리 군집화
         addCoef.col = "black",  # 상관계수 색깔
         tl.col = "black",       # 변수명 색깔
         tl.srt = 45,            # 변수명 45도 기울임
         diag = F)               # 대각 행렬 제외

