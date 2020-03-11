#### 11-1 미국 주별 강력 범죄율 단계 구분도 작성 ####

## -------------------------------------------------------------------- ##
install.packages("ggiraphExtra")
# install.packages("maps")
# install.packages("stringi")
library(ggiraphExtra)
library(maps)

# USArrests : 1973년 미국 주별 10만명당 강력 범죄율 정보.
# - 살인 건, 폭행 건, 도시인구, 강간 건.
str(USArrests)
head(USArrests)
rownames(USArrests)

library(tibble) # convert rowname to culumn

crime <- rownames_to_column(USArrests, var = "state")
crime$state <- tolower(crime$state)

str(crime)

library(ggplot2)

states_map <- map_data("state") # maps 패키지 필요.
head(states_map)

# install.packages("mapproj")
library(mapproj)
# mapproj 패키지를 필요.
ggiraphExtra::ggChoropleth(data = crime,         # 지도에 표현할 데이터
             aes(fill = Murder,    # 색깔로 표현할 변수
                 map_id = state),  # 지역 기준 변수
             map = states_map)     # 지도 데이터

ggChoropleth(data = crime,         # 지도에 표현할 데이터
             aes(fill = Rape,    # 색깔로 표현할 변수
                 map_id = state),  # 지역 기준 변수
             map = states_map,     # 지도 데이터
             interactive = T)      # 인터랙티브



#### 11-2 대한민국 시도별 인구, 결핵 환자 수 단계 구분도 ####

# install.packages("stringi")
# install.packages("processx")
# install.packages("fs")

# install.packages("devtools")
devtools::install_github("cardiomoon/kormaps2014", force = TRUE)

library(kormaps2014)


# 시도별 인구통계 정보 
str(korpop1)
str(changeCode(korpop1))

# 역시 변수명을 영문으로 변경.
library(dplyr)
korpop1 <- rename(korpop1,
                  pop = 총인구_명,
                  name = 행정구역별_읍면동)

# 시도별 인구지도 데이터 
str(changeCode(kormap1))

ggChoropleth(data = korpop1,       # 지도에 표현할 데이터
             aes(fill = pop,       # 색깔로 표현할 변수
                 map_id = code,    # 지역 기준 변수
                 tooltip = name),  # 지도 위에 표시할 지역명
             map = kormap1,        # 지도 데이터
           interactive = T)        # 인터랙티브


## ----- 결핵 환자 단계 구분도 -------------------------------- ##
str(changeCode(tbc)) #komap2014에 있는 데이터

ggChoropleth(data = tbc,           # 지도에 표현할 데이터
             aes(fill = NewPts,    # 색깔로 표현할 변수
                 map_id = code,    # 지역 기준 변수
                 tooltip = name),  # 지도 위에 표시할 지역명
             map = kormap1,        # 지도 데이터
             interactive = T)      # 인터랙티브

