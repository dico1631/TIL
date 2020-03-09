## 7장 데이터 정재 
#### 07-1 결측치 정재 ####

## --- 결측치 찾기----------------------------------- ##
df <- data.frame(sex = c("M", "F", NA, "M", "F", NA),
                 score = c(5, 4, 3, 4, NA, 7))
df

is.na(df)               # 결측치 확인
table(is.na(df))        # 결측치 빈도 출력
table(is.na(df$sex))    # sex 결측치 빈도 출력
table(is.na(df$score))  # score 결측치 빈도 출력

colSums(is.na(df))
colMeans(is.na(df))

mean(df$score)  # 평균 산출
sum(df$score)   # 합계 산출


## ----- 결측치 제거 ---------------------------------- ##
library(dplyr)                # dplyr 패키지 로드
df %>% filter(is.na(score))   # score가 NA인 데이터만 출력
df %>% filter(!is.na(score))  # score 결측치 제거하고 출력, 위 아래 같음 

df_nomiss <- df %>% filter(!is.na(score))  # score 결측치 제거
mean(df_nomiss$score)                      # score 평균 산출
sum(df_nomiss$score)                       # score 합계 산출

df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))  # score, sex 결측치 제거
df_nomiss                                                # 출력

df_nomiss2 <- na.omit(df)  # 모든 변수에 결측치 없는 데이터 추출
df_nomiss2                 # 출력


## -------- 함수의 결측치 제외 기능 -------------------------- ##
mean(df$score, na.rm = T)  # 결측치 제외하고 평균 산출
sum(df$score, na.rm = T)   # 결측치 제외하고 합계 산출

exam <- read.csv("Data/csv_exam.csv")  # 데이터 불러오기
exam[c(3, 8, 15), "math"] <- NA   # 3, 8, 15행의 math에 NA 할당
exam

# math에는 3row, english에는 5row, science에는 15번째 row가 결측인인 exam1을 만들자.
rowna <- c(3, 8, 15); colna <- c(3, 4, 5)
nas <- cbind(rowna, colna)
nas
exam1 <- exam
exam1[nas] <- NA
exam1

## - 원래로 돌아와서
exam %>% summarise(mean_math = mean(math))  # math 평균 산출

# math 결측치 제외하고 평균 산출
exam %>% summarise(mean_math = mean(math, na.rm = T)) 
# exam %>% mutate(mean_math = mean(math, na.rm = T)) 

exam %>% summarise(mean_math = mean(math, na.rm = T),      # 평균 산출
                   sum_math = sum(math, na.rm = T),        # 합계 산출
                   median_math = median(math, na.rm = T))  # 중앙값 산출


## ----------- 결측치 대체: 평균값 ---------------------- ##
mean(exam$math, na.rm = T) # 결측치 제외하고 math 평균 산출

navec <- exam$math
imput <- mean(exam$math, na.rm = T)
imput

exam$math <- ifelse(is.na(exam$math), imput, exam$math)  # math가 NA면 55로 대체

mean_imput <- function(navec){
  imput <- mean(navec, na.rm=T)
  nona <- ifelse(is.na(navec), imput, navec)
  return (nona)
}
exam$math <- mean_imput(exam$math)
mean(exam$math)

### Quiz p170 실습하기 ###

mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212), "hwy"] <- NA

# 1번
table(is.na(mpg$drv))
table(is.na(mpg$hwy))

# 2번
mpg %>%
  select(drv, hwy) %>%
  filter(!is.na(hwy)) %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy)) %>%
  arrange(desc(mean_hwy))


### Quiz 추가 ####
# 결측치가 들어있는 mpg 데이터를 활용해서 문제를 해결해보세요.
mpg <- as.data.frame(ggplot2::mpg)
rowna <- c(1, 8, 27, 89, 101, 73, 189, 211)
colna <- c(7, 9)
rowna
colna
nas <- cbind(rowna, colna)
nas
mpg[nas] <- NA

# • Q1. drv(구동방식)별로 hwy(고속도로 연비) 평균이 어떻게 다른지 알아보자.
## - 분석을 하기 전에 우선 두 변수에 결측치가 있는지 확인하자.
is.na(mpg$drv)
is.na(mpg$hwy)

## - drv 변수와 hwy 변수에 결측치가 몇 개 있는지 알아보세요.
table(is.na(mpg$drv))
table(is.na(mpg$hwy))


# • Q2. filter()를 이용해 hwy 변수의 결측치를 제외하고,
## - 어떤 구동방식의 hwy 평균이 높은지 알아보세요.
## - 하나의 dplyr 구문으로 만들어야 합니다.
mean_hwy = mpg %>%
  filter(!is.na(hwy)) %>%
  group_by(drv) %>%
  summarise(hwy_mean = mean(hwy)) %>% 
  arrange(hwy_mean)

# • Q3. drv 그룹별 hwy의 평균으로 결측치를 대체하고자 한다면?
input_drv <- 0
filtered_mpg <- mpg %>%
  select(drv, hwy) %>%
  filter(drv == input_drv)

means <- function(input_drv){
    notna_mean = mean(filtered_mpg$hwy, na.rm = T)
    return(notna_mean)
}

mpg$hwy <- ifelse(is.na(mpg$hwy), means(mpg$drv), mpg$hwy)

table(is.na(mpg$hwy))

# 발전형
left_join(mpg, mean_hwy, by = "drv") %>%
  mutate(muhwy = ifelse(is.na(hwy), mean_hwy, hwy))

#### 07-2 이상치 정재하기 ####

## ------ 이상치 제거하기 : 존재할 수 없는 값 ---------------------- ##
outlier <- data.frame(sex = c(1, 2, 1, 3, 2, 1),
                         score = c(5, 4, 3, 4, 2, 6))
outlier

table(outlier$sex)
table(outlier$score)

# sex가 3이면 NA 할당
outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)
outlier

# score가 5보다 크면 NA 할당
outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)
outlier

outlier %>% 
  filter(!is.na(sex) & !is.na(score)) %>%
  group_by(sex) %>%
  summarise(mean_score = mean(score))


## ----------- 이상치 제거: 극단적인 값 ----------------------- ##
mpg <- as.data.frame(ggplot2::mpg)
str(boxplot(mpg$hwy))

# 상자 그림 통계치 출력
hwyStats <- boxplot(mpg$hwy)$stats            

# 12~37 벗어나면 NA 할당
## - 독립변수가 아니라면, 이렇게 수행하면 절대 않된다.
# > 다른 요소에 영향을 받는 것은 그것의 값만 보고 이상치인지 여부를 판단하면 안된다.
## - 주성분으로 변경한 후에 아웃라이어를 식별하여 제거해야한다.
# 주성분 변경 : 모든 변수를 독립변수로 바꾸는 것

mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy)
mpg$hwy <- ifelse(mpg$hwy < hwyStats[1] | 
                    mpg$hwy > hwyStats[5], NA, mpg$hwy)

# 결측치 확인
table(is.na(mpg$hwy))  

mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy, na.rm = T))

x <- c(1:8, 10)
y <- x**3
boxplot(x)
boxplot(y)


### Quiz p178 실습하기 ###
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10,14,58,93), "drv"] <- "k"
mpg[c(29,43,129,203), "cty"] <- c(3,4,39,42)

# 1번
mpg %>%
  select(drv) %>%
  group_by(drv) %>%
  summarise(num = n())

mpg$drv <- ifelse(mpg$drv == "k", NA, mpg$drv)

table(is.na(mpg$drv))

# 2번
boxplot(mpg$cty)
boxplot(mpg$cty)$stats
mpg$cty <- ifelse(mpg$cty > 26 | mpg$cty < 9, NA, mpg$cty)
table(is.na(mpg$cty))

# 3번
mpg %>%
  select(drv, cty) %>%
  filter(!is.na(drv) & !is.na(mpg$cty)) %>%
  group_by(drv) %>%
  summarise(cty_mean = mean(cty))


## ------------ summary -------------- ##
## 1.결측치 정제하기

# 결측치 확인
table(is.na(df$score))

# 결측치 제거
df_nomiss <- df %>% filter(!is.na(score))

# 여러 변수 동시에 결측치 제거
df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))

# 함수의 결측치 제외 기능 이용하기
mean(df$score, na.rm = T)
exam %>% summarise(mean_math = mean(math, na.rm = T))

exam %>% group_by(class) %>%
  summarise(mean_math = mean(math))



## 2.이상치 정제하기

# 이상치 확인
table(outlier$sex)

# 결측 처리
outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)

# boxplot으로 극단치 기준 찾기
boxplot(mpg$hwy)$stats

# 극단치 결측 처리
mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy)

