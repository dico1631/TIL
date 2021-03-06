## 6장. 데이터 가공하기 
#### 06-2 데이터 전처리 ####

## -------------------------------------------------------------------- ##
library(dplyr)
exam <- read.csv("C:/Users/student/Desktop/TIL/R/Doit_R-master/Data/csv_exam.csv")
exam

# redirection의 이해. git command 사용.
# exam에서 class가 1인 경우만 추출하여 출력
dplyr::filter(.data = exam, class==1)

# 아래 두 식이 동일
# dplyr:: 는 여기선 필수는 아니지만 만일 다른 패키지에도 filter가 있을 경우 명시 필요
# 명시 안하면 제일 최근에 불러온 패키지의 것을 사용
exam1 <- exam %>% dplyr::filter(class == 1)
exam1 <- filter(exam, exam$class==1)

exam[exam$class==1,]

# 2반인 경우만 추출
exam %>% filter(class == 2) # row index 초기화
exam[exam$class==2,]        # row index 보존.

# 1반이 아닌 경우
exam %>% filter(class != 1)

# 3반이 아닌 경우
exam %>% filter(class != 3)

# 1반과 3반이 아닌 경우
exam %>% filter(class != 3 & class != 1)
exam %>% filter(!(class %in% c(3, 1)))

# 1반 또는 3반인 경우
exam %>% filter(class == 3 | class == 1)
exam %>% filter(class %in% c(3, 1))


## -------------------------------------------------------------------- ##
# 수학 점수가 50점을 초과한 경우
math50 <- exam %>% filter(math > 50) # row index도 초기화한다.
math50
math50 <- exam[exam$math > 50, ]
rownames(math50) <- 1:dim(math50)[1]
rownames(math50)
# 수학 점수가 50점 미만인 경우
exam %>% filter(math < 50)

# 영어 점수가 80점 이상인 경우
exam %>% filter(english >= 80)
# exam %>% filter(english =< 80) # 에러 항상 부등호가 앞

# 영어 점수가 80점 이하이고, 수학 점수가 50점 이상인 것.
exam %>% filter(english <= 80) %>%
  filter(math >= 50)
exam %>% filter(english <= 80 & math >= 50)

# 수학 점수가 50점 이상 80점 미만인 경우
# math50 <- exam %>% filter(80 > math >= 50)
exam %>% filter(80 > math & math >= 50)


## -------------------------------------------------------------------- ##
# 1반이면서 수학 점수가 50점 이상인 경우
exam %>% filter(1 == class & math >= 50)

# exam[row_condition, ]
exam[exam[,"class"]==1 & exam[,"math"]>=50,]


# 2반이면서 영어 점수가 80점 이상인 경우
exam %>% filter(class == 2 & english >= 80)
exam[exam$class == 2 & exam$english >= 80,]

# 3개 과목 평균 점수가 75점 이상``
exam %>% filter(math + english + science >= (75*3))
exam %>% filter(math + english + science >= 225)
exam[rowSums(exam[,3:5]) >= (75*3),]

# 행에 boolean vector를 넣어줘서 행별로 추출하는 원리 
exam %>% filter(math >= 50)

exam[exam[, "math"]>=50, ]

exam_sub = exam[1:5,]
exam_sub[c(F, T, T,F,T),]
exam_sub[exam_sub[,"math"]>=50, ]


## -------------------------------------------------------------------- ##
# 수학 점수가 90점 이상이거나 영어 점수가 90점 이상인 경우
exam %>% filter(math >= 90 | english >= 90)
exam[exam[,"math"]>=90 | exam[,"english"]>=90, ]

# 영어 점수가 90점 미만이거나 과학점수가 50점 미만인 경우
exam %>% filter(english < 90 | science < 50)

# 과학 점수가 50점 이상 80점 이하인 3반이 아닌 학생 중 영어점수가 가장 높은 id는?
filt_stu <- exam %>% filter(class != 3) %>%
  filter(science >= 50 & science <= 80) %>%
  select(id, english)

max_eng <- max(filt_stu$english)

filt_stu %>% filter(english == max_eng) %>%
  select(id)

# 간소화
exam %>% filter(class != 3) %>%
  filter(science >= 50 & science <= 80) %>%
  select(id, english) %>%
  filter(english == max(english))

## [참고] 이제 이것을 함수로 만들어보자. 
## - 조건문장을 r code로 변환하는 것이 중요하다.
#parse : 문자열을 코드로 변경, 실행 X / eval : 코드를 실행시킴
parse(text="class != 3")
eval(parse(text="2+3"))
eval(parse(text="exam$class"))
a <- eval(parse(text="2+3"))
a

condVec <- c(
  "class != 3",
  "science >= 50 & science <= 80"
)
paste("subdata %>% filter(", condVec[1], ")", sep="")
class(max(exam["english"]))

findValue <- function(data, condVect, subject, ft, search){
  subdata <- data
  for(cond in condVect){
    rCode <- paste("subdata %>% filter(", cond, ")", sep="")
    subdata <- eval(parse(text=rCode))
  }
  subj_stat <- ft(subdata[subject])
  # subdata <- subdata[subdata[,subject]==subj_stat, search]
  rCode <- paste("subdata %>% filter(", subject, " == subj_stat)", sep="")
  subdata <- eval(parse(text=rCode))
  result <- subdata[search]
  
  return(result)
}
exam["english"]
filter("class != 3")
findValue(exam, condVec, "english", max, "id")


findId <- function(data, ifexpVector, subject, ft, search){
  subdata <- data
  for(ifexp in ifexpVector){
    rCode <- paste("subdata <- subdata %>% filter(", ifexp, ")", sep="")
    eval(parse(text=rCode))
  }

  rCode <- paste(ft, "(subdata$", subject, ")", sep="")
  stat_sub <- eval(parse(text=rCode))
  rCode <- paste("subdata %>% filter(", subject, " == stat_sub)", sep="")
  subdata <- eval(parse(text=rCode))
  rCode <- paste("subdata$", search, sep="")
  result <- eval(parse(text=rCode))
  
  return(result)
}
ifexpVector = c(
  "science >= 50 & science <= 80",
  "class != 3"
)

findId(exam, ifexpVector, "english", "max", "id")


## - 항상 부등호가 등호보다 앞서 입력되어야 한다.
50 <= 30


## -------------------------------------------------------------------- ##
# 1, 3, 5 반에 해당되면 추출
exam %>% filter(class == 1 | class == 3 | class == 5)
exam[exam[,"class"] %in% c(1,3,5),]
exam[,"class"] %in% c(1,3,5)

exam %>% filter(class %in% c(1,3,5))


## -------------------------------------------------------------------- ##
class1 <- exam %>% filter(class == 1)  # class가 1인 행 추출, class1에 할당
class2 <- exam %>% filter(class == 2)  # class가 2인 행 추출, class2에 할당

mean(class1$math)                      # 1반 수학 점수 평균 구하기
mean(class2$math)                      # 2반 수학 점수 평균 구하기

### Quiz 실습하기 ###

# 1번
mpg<-ggplot2::mpg
str(mpg)
displ.4 <- mpg %>% filter(displ <= 4)
mean(displ.4$hwy)

displ.5 <- mpg %>% filter(displ >= 5)
mean(displ.5$hwy)

# 2번
mpg.select <- mpg %>% select(manufacturer, cty) 
mpg.select.audi <- mpg.select %>% filter(manufacturer == "audi")
mpg.select.toyota <- mpg.select %>% filter(manufacturer == "toyota")
mean(mpg.select.audi$cty)
mean(mpg.select.toyota$cty)

#3번
mpg.three <- mpg %>% 
  select(manufacturer, hwy) %>% 
  filter(manufacturer %in% c("chevrolet", "ford", "honda"))
mean(mpg.three$hwy)




#### 06-3 필요한 변수만 추출 ####

## -------------------------------------------------------------------- ##
exam %>% select(math)                  # math 추출
select(exam, math)

exam %>% select(english)               # english 추출
exam %>% select(class, math, english)  # class, math, english 변수 추출
exam %>% select(-math) %>% head       # math 제외
head(exam %>% select(-math))

exam %>% select(-math, -english)      # math, english 제외
exam %>% select(-c(4, 3)) # 순서에 의한 색인으로만 가능
exam[c(3,4)]
exam[-c(3,4)]
exam[c("math", "english")]
exam[-c("math", "english")] # error 발생. 제외시 색인으로만 가능.
exam[,colnames(exam)[-c(3,4)]]
# For a data frame, rownames and colnames eventually call row.names and names respectively, but the latter are preferred.
colnames(exam)[-c(3,4)]


## --- dplyr 함수 조합하기 ------------------------------------- ##
# class가 1인 행만 추출한 다음 english 추출
exam %>% filter(class == 1) %>% 
  select(english)

exam %>%
  filter(class == 1) %>%  # class가 1인 행 추출
  select(english)         # english 추출

exam %>% 
  select(id, math) %>%    # id, math 추출
  head                    # 앞부분 6행까지 추출

exam2 <- exam %>% 
  select(id, math) %>%  # id, math 추출
  head(10)              # 앞부분 10행까지 추출

mpg<-ggplot2::mpg
dis4 <- mpg %>% filter(displ <= 4) %>% select(hwy)
dis5 <- mpg %>% filter(displ >= 5) %>% select(hwy)
m4 = mean(dis4$hwy)
m5 = mean(dis5$hwy)

r45 = (m4 -m5)/(m5+m4)*2

(m5+m4)/2
r45


### Quiz 실습하기 ###

# 1번
mpg.select <- mpg %>% select(class, cty)

#2번
mpg.select %>% 
  filter(class %in% c("suv", "compact")) %>%
  group_by(class)

##문제 : 각 반별로 science의 최고점과 최저점인 학생 id를 구하라.
install.packages("readxl")
library(readxl)
df_exam <- read_excel("C:/Users/student/Desktop/TIL/R/Doit_R-master/Data/excel_exam.xlsx")
df_exam.answer1 <- df_exam %>% 
  select(id, class, science) %>%
  group_by(class) %>%
  filter(science == max(science) | science == min(science))
df_exam.answer1

# 발전형
df_exam.answer2 <- df_exam %>% 
  select(id, class, science) %>%
  group_by(class) %>%
  summarise(minId = id[which.min(science)],
            maxId = id[which.min(science)])
df_exam.answer2

#### 06-4 순서대로 정렬하기 ####

## -------------------------------------------------------------------- ##
exam %>% arrange(math)         # math 오름차순 정렬
arrange(exam, math)
exam %>% arrange(desc(math))   # math 내림차순 정렬
exam %>% arrange(class, math)  # class 및 math 오름차순 정렬
a <- exam %>% arrange(class, desc(math))
b <- exam %>% arrange(desc(math)) %>% arrange(class)
all(a==b)  # 순서까지 다 같아야함
c <- c(1, 2, 3); d <- c(1, 5, 7, 8)
all(c==d)
any(c==d)

sort(exam$math)  # 해당 변수값을 정렬해서 보여줌
arrange(exam, math) # 해당 요소에 대해 dataframe 자체를 정렬

sort(exam$math, index.return=T)  # 각각의 인덱스도 알려줌
math_idx<-sort(exam$math, index.return=T)$ix  # 인덱스가 담긴 곳이 ix, 인덱스 요소만 추출
math_idx

math_idx2<-order(exam$math)  # 정렬 후 인덱스를 보여주는 함수
math_idx2
all(math_idx == math_idx2)  # 1과 2 방법 결과가 같음

# 아래 3개는 같은 내용이다.
exam %>% arrange(math)
exam[math_idx,]  # 위의 인덱스 행만 추출
exam[order(exam$math),]  # 위 문장과 같음


### Quiz 실습하기 ###

# 1번
mpg %>% 
  select(manufacturer, model, hwy) %>%
  filter(manufacturer == "audi") %>%
  arrange(hwy) %>%
  head(5)


#### 06-5 파생변수 추가하기 ####

## -------------------------------------------------------------------- ##
exam %>%
  mutate(total = math + english + science) %>%  # 총합 변수 추가
  head                                          # 일부 추출

exam_new <- exam %>%
  mutate(total = math + english + science,         # 총합 변수 추가
         mean = (math + english + science)/3)      # 일부 추출

exam_new

exam %>%
  mutate(test = ifelse(science >= 60, "pass", "fail")) %>%
  head

exam %>%
  mutate(total = math + english + science) %>%  # 총합 변수 추가
  arrange(total) %>%                            # 총합 변수 기준 정렬
  head                                          # 일부 추출

### Quiz 실습하기 ###
# 1번
mpg <- mpg %>% select(model, year, cty, hwy) %>% mutate(total = cty + hwy)
mpg

# 2번
mpg = mpg %>% mutate(means = total/2)

# 3번
mpg %>% arrange(desc(means)) %>% head(3)

# 4번
mpg <- ggplot2::mpg
mpg %>%  
  select(model, year, cty, hwy) %>% 
  mutate(total = cty + hwy, means = total/2) %>%
  arrange(desc(means)) %>%
  head(3)


#### 06-6 집단별 요약하기 ####

## -------------------------------------------------------------------- ##
exam %>% summarise(mean_math = mean(math))  # math 평균 산출
summary(exam)

exam %>% 
  group_by(class) %>%                   # class별로 분리
  summarise(mean_math = mean(math))     # math 평균 산출
str(group_by(exam, class))

mean_math <- exam %>% 
  group_by(class) %>%                   # class별로 분리
  summarise(mean(math))     # math 평균 산출
mean_math

exam %>% 
  group_by(class) %>%                   # class별로 분리
  summarise(mean_math = mean(math),     # math 평균
            sum_math = sum(math),       # math 합계
            median_math = median(math), # math 중앙값
            n = n())                    # 학생 수

mpg <- ggplot2::mpg

mpg %>%
  group_by(manufacturer, drv) %>%       # 회사별, 구동방식별 분리
  summarise(mean_cty = mean(cty)) %>%   # cty 평균 산출
  arrange(desc(mean_cty)) %>%
  head(10)                              # 일부 출력

exam %>% distinct(class)
exam %>% union(class) # 에러

## ----- dplyr 조합하기 --------------------------------- ##
# - 문제) 회사별로 
# - “suv” 자동차의 도시 및 고속도로 통합 연비 평균을 구해 
# - 내림차순으로 정렬하고, 1~5위까지 출력하기
mpg %>%
  group_by(manufacturer) %>%           # 회사별로 분리
  filter(class == "suv") %>%           # suv 추출
  mutate(tot = (cty+hwy)/2) %>%        # 통합 연비 변수 생성
  summarise(mean_tot = mean(tot)) %>%  # 통합 연비 평균 산출
  arrange(desc(mean_tot)) %>%          # 내림차순 정렬
  head(5)                              # 1~5위까지 출력

# 속대 개선을 위해 select, filter를 먼저 수행하라.
mpg %>% filter(class == 'suv') %>%
  select(manufacturer, cty, hwy) %>%
  group_by(manufacturer) %>%
  mutate(tot=(cty+hwy)/2) %>%
  summarise(mean_tot = mean(tot)) %>%  # 통합 연비 평균 산출
  arrange(desc(mean_tot)) %>%          # 내림차순 정렬
  head(5)

mpg
mpg$class
table(mpg$class)

mpg %>% group_by(class) %>%
  mutate(total = (cty + hwy)/2) %>%
  summarise(mean_tot = mean(total)) %>%
  arrange(mean_tot) %>%
  head(3)

### Quiz 실습하기 ###

# 1번, 2번
mpg %>%
  group_by(class) %>%
  summarise(mean_cty = mean(cty)) %>%
  arrange(desc(mean_cty))

# 3번
str(mpg)
mpg %>%
  group_by(manufacturer) %>%
  summarise(mean_hwy = mean(hwy)) %>%
  arrange(desc(mean_hwy)) %>%
  head(3)

# 4번
mpg %>%
  filter(class == "compact") %>%
  group_by(manufacturer) %>%
  summarise(compact_num = n())

#### 06-7 데이터 합치기 ####

## -------------------------------------------------------------------- ##
# 중간고사 데이터 생성
test1 <- data.frame(id = c(1, 2, 3, 7, 8),           
                    midterm = c(60, 80, 70, 90, 85))

# 기말고사 데이터 생성
test2 <- data.frame(id = c(1, 2, 3, 4, 5),           
                    final = c(70, 83, 65, 95, 80))

test1  # test1 출력
test2  # test2 출력

total <- left_join(test1, test2, by = "id")  # id 기준으로 합쳐서 total에 할당
total <- left_join(test2, test1, by = "id")
total                                        # total 출력

data.frame(mt=test1$midterm, fn=test2$final)
cbind(test1, test2$final)


## -------------------------------------------------------------------- ##
name <- data.frame(class = c(1, 2, 3, 4, 5),
                   teacher = c("kim", "lee", "park", "choi", "jung"))
name
name2 <- rbind(name, name)
name2

exam
name
exam_new <- left_join(exam, name, by = "class")
exam_new

exam_new <- left_join(exam, name2, by = "class") # 중복도 다 나온다. 중복 제거 안됨
exam_new

duplicated(name2)  # 각 행의 중복여부 알려줌
name2[duplicated(name2),] # name2에서 중복 제거



## -------------------------------------------------------------------- ##
# 학생 1~5번 시험 데이터 생성
group_a <- data.frame(id = c(1, 2, 3, 4, 5),
                      test = c(60, 80, 70, 90, 85))

# 학생 6~10번 시험 데이터 생성
group_b <- data.frame(id = c(6, 7, 8, 9, 10),
                      test = c(70, 83, 65, 95, 80))

group_a  # group_a 출력
group_b  # group_b 출력

group_all <- bind_rows(group_a, group_b)  # 데이터 합쳐서 group_all에 할당
group_all                                 # group_all 출력

rbind(group_a, group_b)

# cbind, rbind, merge
# dplyr 패키지의 bind_cols, bind_rows, inner_join, left_join, ...
# cbind보다는 left_join이 느림/ bind_rows보다는 rbind가 느림
# merge = join, 근데 join이 더 빠름
example(merge)

### Quiz 실습하기 ###
#혼자서 해보기
fuel <- data.frame(fl = c("c", "d", "e", "p", "r"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)
str(fuel)

# 1번
str(mpg)
mpg <- left_join(mpg, fuel, by = "fl")
str(mpg)

# 2번
mpg %>% select(model, fl, price_fl) %>% head(5)




## ----- 6장 정리하기 ------------------------------- ##
## 1.조건에 맞는 데이터만 추출하기
exam %>% filter(english >= 80)

# 여러 조건 동시 충족
exam %>% filter(class == 1 & math >= 50)

# 여러 조건 중 하나 이상 충족
exam %>% filter(math >= 90 | english >= 90)
exam %>% filter(class %in% c(1,3,5))


## 2.필요한 변수만 추출하기
exam %>% select(math)
exam %>% select(class, math, english)

## 3.함수 조합하기, 일부만 출력하기
exam %>%
  select(id, math) %>%
  head(10)

## 4.순서대로 정렬하기
exam %>% arrange(math)         # 오름차순 정렬
exam %>% arrange(desc(math))   # 내림차순 정렬
exam %>% arrange(class, math)  # 여러 변수 기준 오름차순 정렬

## 5.파생변수 추가하기
exam %>% mutate(total = math + english + science)

# 여러 파생변수 한 번에 추가하기
exam %>%
  mutate(total = math + english + science,
         mean = (math + english + science)/3)

# mutate()에 ifelse() 적용하기
exam %>% mutate(test = ifelse(science >= 60, "pass", "fail"))

# 추가한 변수를 dplyr 코드에 바로 활용하기
exam %>%
  mutate(total = math + english + science) %>%
  arrange(total)


## 6.집단별로 요약하기
exam %>%
  group_by(class) %>%
  summarise(mean_math = mean(math))

# 각 집단별로 다시 집단 나누기
mpg %>%
  group_by(manufacturer, drv) %>%
  summarise(mean_cty = mean(cty))


## 7.데이터 합치기
# 가로로 합치기
total <- left_join(test1, test2, by = "id")

# 세로로 합치기
group_all <- bind_rows(group_a, group_b)

##---------분석도전!----------
midwest <- ggplot2::midwest
str(midwest)

# 1번
midwest <- midwest %>% 
  mutate(child_rate = (poptotal - popadults)/poptotal * 100)

# 2번
midwest %>%
  arrange(desc(child_rate)) %>%
  head(5)

# 3번
midwest %>%
  mutate(child_category = ifelse(child_rate >= 40, "large",
                                 ifelse(child_rate >= 30, "middle", "small"))) %>%
  group_by(child_category) %>%
  summarise(childrate_count = n())

# 4번
midwest %>%
  select(popasian, poptotal, state, county) %>%
  mutate(asian_rate = popasian / poptotal * 100) %>%
  arrange(asian_rate) %>%
  select(state, county, asian_rate) %>%
  head(10)
