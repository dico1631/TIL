## 10장. 텍스트 마이닝
rm(list=ls())
#### 10-1 힙합 가사 ####

## -------------------------------------------------------------------- ##
# 패키지 설치
install.packages("rJava")
install.packages("memoise")
install.packages("KoNLP", dependencies=TRUE)
# install.packages("Rcpp") # useNIADic 함수 실행에 필요할 경우
# install.packages("stringr")
# install.packages("rlang")
install.packages("stringi")

# 패키지 로드
library(KoNLP)
library(dplyr)
library(Rcpp)

# java 폴더 경로 설정
# Sys.setenv(JAVA_HOME="C:/Program Files/Java/jre1.8.0_111/")

# NIADic : 형태소 사전 93만 단어, useSejoinDic 9만, 시스템 사전 28만 단어
# 업데이트 문의시 무시하고 그냥 Enter 입력.
useNIADic()

# 필요시 R 재시작 : [Ctrl][Shift][F10]

# 데이터 불러오기
txt <- readLines("Data/hiphop.txt")
head(txt)

library(stringr)

# 특수문제 제거: 숫자, _ 및 언어코드 가능한 문자를 제외한 문자.
txt <- str_replace_all(txt, "\\W", " ")


## ------------- 사용 빈도가 높은 단어 추출 --------------- ##
KoNLP::extractNoun("대한민국의 영토는 한반도와 그 부속도서로 한다")

# 가사에서 명사추출
nouns <- extractNoun(txt)
str(nouns)
class(nouns)

nouns[[2]][2]
class(nouns[[2]])

unlist(nouns)

# 추출한 명사 list를 문자열 벡터로 변환, 단어별 빈도표 생성
wcount <- table(unlist(nouns))
head(wcount, 10)
str(wcount)

# 데이터 프레임으로 변환
df_word <- as.data.frame(wcount)
str(df_word)
df_word <- as.data.frame(wcount, stringsAsFactors = F)
df_word[1000:1040,]

# 변수명 수정
df_word <- rename(df_word,
                  word = Var1,
                  freq = Freq)

# 두 글자 이상 단어 추출
df_word <- filter(df_word, nchar(word) >= 2)
df_word <- df_word %>% filter(nchar(word) >= 2)

top_20 <- df_word %>%
  arrange(desc(freq)) %>%
  head(20)

top_20


## --------------- 워드 클라우드 생성 ----------------- ##
# 패키지 설치
install.packages("wordcloud")

# 패키지 로드
library(wordcloud)
library(RColorBrewer)

pal <- brewer.pal(8,"Dark2")  # Dark2 색상 목록에서 8개 색상 추출

set.seed(1234)
wordcloud(words = df_word$word,  # 단어
          freq = df_word$freq,   # 빈도
          min.freq = 2,          # 최소 단어 빈도
          max.words = 200,       # 표현 단어 수
          random.order = F,      # 고빈도 단어 중앙 배치
          rot.per = .1,          # 회전 단어 비율
          scale = c(4, 0.3),     # 단어 크기 범위
          colors = pal)          # 색깔 목록

# 많이 사용된 단어가 진한 파란색으로 표시되도록 조정.
pal <- brewer.pal(9,"Blues")[5:9]  # 색상 목록 생성
set.seed(1234)                     # 난수 고정

wordcloud(words = df_word$word,    # 단어
          freq = df_word$freq,     # 빈도
          min.freq = 2,            # 최소 단어 빈도
          max.words = 200,         # 표현 단어 수
          random.order = F,        # 고빈도 단어 중앙 배치
          rot.per = .1,            # 회전 단어 비율
          scale = c(4, 0.3),       # 단어 크기 범위
          colors = pal)            # 색상 목록


#### 10-2 국정원 트윗 텍스트마이닝 ####

## -------------- 국정원 계정 트윗 데이터 --------------------- ##
# 데이터 로드
twitter <- read.csv("Data/twitter.csv",
                    header = T,
                    stringsAsFactors = F,
                    fileEncoding = "UTF-8")
head(twitter)
twitter[1:4,]

# 변수명 수정
twitter <- rename(twitter,
                  no = 번호,
                  id = 계정이름,
                  date = 작성일,
                  tw = 내용)

names(twitter)

# 특수문자 제거
twitter$tw <- str_replace_all(twitter$tw, "\\W", " ")
head(twitter$tw)

#--------------- 단어 빈도표 생성 -------------------#
# 트윗에서 명사추출
nouns <- extractNoun(twitter$tw)

# 추출한 명사 list를 문자열 벡터로 변환, 단어별 빈도표 생성
wordcount <- table(unlist(nouns))

# 데이터 프레임으로 변환
df_word <- as.data.frame(wordcount, stringsAsFactors = F)

# 변수명 수정
df_word <- rename(df_word,
                  word = Var1,
                  freq = Freq)


# 두 글자 이상 단어만 추출
df_word <- filter(df_word, nchar(word) >= 2)

# 상위 20개 추출
top20 <- df_word %>%
  arrange(desc(freq)) %>%
  head(20)

top20
rownames(top20)

#------------ 단어 빈도 막대 그래프 생성 -------------#
library(ggplot2)

order <- arrange(top20, freq)$word               # 빈도 순서 변수 생성

ggplot(data = top20, aes(x = word, y = freq)) +  
  ylim(0, 2500) +
  geom_col() + 
  coord_flip() +
  scale_x_discrete(limit = order) +              # 빈도 순서 변수 기준 막대 정렬
  geom_text(aes(label = freq), hjust = -0.3)     # 빈도 표시. 0.3 포인트 오른쪽.

pal <- brewer.pal(8,"Dark2")       # 색상 목록 생성
set.seed(1234)                     # 난수 고정

wordcloud(words = df_word$word,    # 단어
          freq = df_word$freq,     # 빈도
          min.freq = 10,           # 최소 단어 빈도
          max.words = 200,         # 표현 단어 수
          random.order = F,        # 고빈도 단어 중앙 배치
          rot.per = .1,            # 회전 단어 비율
          scale = c(6, 0.2),       # 단어 크기 범위
          colors = pal)            # 색상 목록

pal <- brewer.pal(9,"Blues")[5:9]  # 색상 목록 생성
set.seed(1234)                     # 난수 고정

wordcloud(words = df_word$word,    # 단어
          freq = df_word$freq,     # 빈도
          min.freq = 10,           # 최소 단어 빈도
          max.words = 200,         # 표현 단어 수
          random.order = F,        # 고빈도 단어 중앙 배치
          rot.per = .1,            # 회전 단어 비율
          scale = c(6, 0.2),       # 단어 크기 범위
          colors = pal)            # 색상 목록

