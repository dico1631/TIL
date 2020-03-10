## 8장 그래프 만들기
#### 08-2 산점도 - 수치변수 간 관계 ####
rm(list=ls())
## -------------------------------------------------------------------- ##
library(ggplot2)
mpg <- ggplot2::mpg

# x축 displ, y축 hwy로 지정해 배경 생성
ggplot(data = mpg, aes(x = displ, y = hwy))

# 배경에 산점도 추가
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()
ggplot(mpg, aes(displ, hwy)) + geom_point()

# x축 범위 3~6으로 지정
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point() + 
  xlim(3, 6)

# x축 범위 3~6, y축 범위 10~30으로 지정 
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point() + 
  xlim(3, 6) + 
  ylim(10, 30)

### Quiz 실습하기 ###

# 1번
ggplot(mpg, aes(cty, hwy)) + geom_point()

# 2번
midwest <- ggplot2::midwest
ggplot(midwest, aes(poptotal, popasian)) + geom_point() + xlim(0,500000) + ylim(0,10000)


#### 08-3 막대 그래프 - 집단 간 차이 표현 ####
# geom_col : 빈도가 이미 주어짐, geom_bar : 함수가 빈도를 측정할 것

## -------------------------------------------------------------------- ##
library(dplyr)

df_mpg <- mpg %>% 
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy))

df_mpg

ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) + geom_col()

# - reorder(category, freq): freq 값에 따라 category를 재배열.
ggplot(data = df_mpg, aes(x = reorder(drv, -mean_hwy), 
                          y = mean_hwy)) + geom_col()

table(mpg$drv)
ggplot(data = mpg, aes(x = drv)) + geom_bar()

# 연속형 변수를 넣으면 bar를 썼을 때 자동으로 히스토그램 그려줌(R에서만)
# 아래 둘은 같은 결과가 나옴
ggplot(data = mpg, aes(x = hwy)) + geom_bar(width=1)
ggplot(data = mpg, aes(x = hwy)) + geom_histogram(bins=30)

### Quiz 실습하기 ###

# 1번
library(dplyr)
str(mpg)
mpg2 <- mpg %>%
  filter(class == "suv") %>%
  select(manufacturer, cty) %>%
  group_by(manufacturer) %>%
  summarise(mean_cty = mean(cty)) %>%
  arrange(desc(mean_cty)) %>%
  head(5)
str(mpg2)
ggplot(mpg2, aes(manufacturer, mean_cty, fill = manufacturer)) + geom_col()

# 2번
ggplot(mpg, aes(class)) + geom_bar()




#### 08-4 선 그래프 - 시계열 데이터 표현 ####

## ---- line graph를 위해서는 x, y가 모두 필요 ------- ##
ggplot(data = economics, aes(x = date, y = unemploy)) +
  geom_line()

### Quiz 실습하기 ###
ggplot(economics, aes(date, psavert)) + geom_line()


#### 08-5 상자 그림 - 집단 간 분포 차이 표현 ####

## ------------ boxplot은 y를 필요로한다. ------------ ##
ggplot(data = mpg, aes(y = hwy)) + geom_boxplot()
boxplot(mpg$hwy)
ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()
boxplot(mpg$hwy ~ mpg$drv)  # 결과, 원인

### Quiz 실습하기 ###
mpg %>%
  filter(class %in% c("compact", "subcompact", "suv")) %>%
  select(class, cty) %>%
  ggplot(aes(class, cty)) + geom_boxplot()
  


## ---- 8장 summary -------------------------- ##
## 1.산점도
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()

# 축 설정 추가
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  xlim(3, 6) +
  ylim(10, 30)


## 2.평균 막대 그래프

# 1단계.평균표 만들기
df_mpg <- mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy))

# 2단계.그래프 생성하기, 크기순 정렬하기
ggplot(data = df_mpg, aes(x = reorder(drv, -mean_hwy), y = mean_hwy)) + geom_col()


## 3.빈도 막대 그래프
ggplot(data = mpg, aes(x = drv)) + geom_bar()

## 4.선 그래프
ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()

## 5.상자 그림
ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()

