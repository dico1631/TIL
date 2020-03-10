#### 04-2 ####
rm(list=ls())
## ---------------------------------------------------------------------- ##

english <- c(90, 80, 60, 70)  # 영어 점수 변수 생성
english

math <- c(50, 60, 100, 20)    # 수학 점수 변수 생성
math

# english, math로 데이터 프레임 생성해서 df_midterm에 할당
df_midterm <- data.frame(english, math)
df_midterm
df_midterm[2]  # python과 R 모두 열 색인
df_midterm["math"]
df_midterm$math
# python에서는 끝은 불포함이지만 R에선 포함
# python에서는 아래 것 행 색인, R에선 열 색인
df_midterm[1:2]
# R에서 행 색인 하는 법(행,열)
df_midterm[,1:2]
df_midterm[:,1:2] # 모든 행/열 선택일 때 p는 :을 썼지만 R은 그러면 오류


class <- c(1, 1, 2, 2)
class

df_midterm <- data.frame(english, math, class) #재정의
# 아래 3개는 추가하는 방법
df_midterm$class <- class
df_midterm["class"] <- class
df_midterm[3] <- class # 이름이 안정해짐
names(df_midterm)[4] <- "class" # 그래서 이름 써줘야함
df_midterm

mean(df_midterm$english)  # df_midterm의 english로 평균 산출
mean(df_midterm$math)     # df_midterm의 math로 평균 산술
mean(df_midterm)  # 오류, mean은 백터만 가능
# df에 1:행/2:열 에 대해서 mean이라는 함수를 적용해줘
apply(df_midterm, 2, mean) 
class(df_midterm) # df type
class(df_midterm$math)
class(apply(df_midterm, 2, mean) )
summary(df_midterm[1:2])

# 함수 안에서도 <- 는 변수를 만듬
df_midterm <- data.frame(english <- c(90, 80, 60, 70),
                         math <- c(50, 60, 100, 20),
                         class <- c(1, 1, 2, 2))
df_midterm # 이름이 이상함, 변수가 생성됨
names(df_midterm)[1]

# 함수 안에서는 인자명에 대한 값 대입일 뿐, 변수를 따로 만들지는 않음
df_midterm <- data.frame(english = c(90, 80, 60, 70),
                         math = c(50, 60, 100, 20),
                         class = c(1, 1, 2, 2))
df_midterm # 잘 나옴 

df <- df_midterm  # view 아니고 copy 발생, 원본 변경 X

# 아래 type은 다름
# ,를 쓰면 vector
df$math
df[,2]
df[,"math"]

# dataframe
df[2]
df["math"]

# 행 삽입하기
df[5,] <- c(50,60,1)
df


#### 04-3 ####

## -------------------------------------------------------------------- ##
install.packages("readxl")
library(readxl)

getwd()

df_exam <- readxl::read_excel("./Data/excel_exam.xlsx")  # 엑셀 파일을 불러와서 df_exam에 할당
df_exam                                   # 출력

mean(df_exam$english)
mean(df_exam$science)

# 1번





df_exam_novar <- read_excel("./Data/excel_exam_novar.xlsx")
df_exam_novar

df_exam_novar <- read_excel("Data/excel_exam_novar.xlsx", col_names = F)
df_exam_novar

# 엑셀 파일의 세 번째 시트에 있는 데이터 불러오기
df_exam_sheet <- read_excel("excel_exam_sheet.xlsx", sheet = 3)
df_exam_sheet


## -------------------------------------------------------------------- ##
df_csv_exam <- read.csv("csv_exam.csv")
df_csv_exam

df_csv_exam <- read.csv("csv_exam.csv", stringsAsFactors = F)


## -------------------------------------------------------------------- ##
df_midterm <- data.frame(english = c(90, 80, 60, 70),
                         math = c(50, 60, 100, 20),
                         class = c(1, 1, 2, 2))
df_midterm

write.csv(df_midterm, file = "df_midterm.csv")


## -------------------------------------------------------------------- ##
save(df_midterm, file = "df_midterm.rda")

rm(df_midterm)

load("df_midterm.rda")


## -------------------------------------------------------------------- ##
# 1.변수 만들기, 데이터 프레임 만들기
english <- c(90, 80, 60, 70)  # 영어 점수 변수 생성
math <- c(50, 60, 100, 20)    # 수학 점수 변수 생성
data.frame(english, math)     # 데이터 프레임 생성

# 2. 외부 데이터 이용하기

# 엑셀 파일
library(readxl)                                 # readxl 패키지 로드
df_exam <- read_excel("excel_exam.xlsx")        # 엑셀 파일 불러오기

# CSV 파일
df_csv_exam <- read.csv("csv_exam.csv")         # CSV 파일 불러오기
write.csv(df_midterm, file = "df_midterm.csv")  # CSV 파일로 저장하기

# Rda 파일
load("df_midterm.rda")                          # Rda 파일 불러오기
save(df_midterm, file = "df_midterm.rda")       # Rda 파일로 저장하기

