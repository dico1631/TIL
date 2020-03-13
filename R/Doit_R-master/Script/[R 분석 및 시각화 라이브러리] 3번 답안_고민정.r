#[R 분석 및 시각화 라이브러리]
#tips 데이터에서 size가 3 ~ 5인 데이터에 대해, sex별 tiprate의 평균은?
#- 단, tiprate는 tip/total_bill이다.
#- 단, tips 데이터는 아래와 같이 가져온다.

library(reshape2)
library(dplyr)
str(tips)

table(tips$tip)
table(tips$total_bill)
table(is.na(tips$tip))
table(is.na(tips$total_bill))

tips %>% 
  select(size, sex, tip, total_bill) %>%
  filter(size >= 3 & size <= 5) %>%
  mutate(tiprate = tip/total_bill) %>%
  group_by(sex) %>% 
  summarise(tiprate_mean = mean(tiprate))
  
