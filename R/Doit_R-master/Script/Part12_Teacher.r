## 12장. interactive graph
#### 12-1 plotly 패키지로 인터랙티브 그래프 만들기####

## ------------- 인터랙티브 그래프 만들기 ----------------- ##
install.packages('htmlwidgets')
install.packages("plotly")
library(plotly)

library(ggplot2)
p <- ggplot(data = mpg, aes(x = displ, y = hwy, col = drv)) + 
  geom_point()

ggplotly(p)

# clarity : http://dsmarket.tistory.com/155
p <- ggplot(data = diamonds, aes(x = cut, fill = clarity)) + 
  geom_bar(position = "dodge")

ggplotly(p)

library(htmlwidgets)

saveWidget(ggplotly(p), file = "plotly.html")

#### 12-2 dygraphs 패키지로 인터랙티브 시계열 그래프 만들기 ####

## ---------- 인터랙티브 시계열 그래프 만들기 ------------- ##
install.packages("dygraphs")
library(dygraphs)

economics <- ggplot2::economics
head(economics)

# - ggplot을 이용하여 date를 x축으로 unemploy y축으로 시계열 
# - 그래프를 그래보세요.

library(xts)
eco <- xts(economics$unemploy, order.by = economics$date)
head(eco)
class(eco)
str(eco)

# 그래프 생성
dygraph(eco)

# 날짜 범위 선택 기능
dygraph(eco) %>% dyRangeSelector()


# 저축률 : personal saving rate
eco_a <- xts(economics$psavert, order.by = economics$date)

# 실업자 수
eco_b <- xts(economics$unemploy/1000, order.by = economics$date)

eco2 <- cbind(eco_a, eco_b)                 # 데이터 결합
colnames(eco2) <- c("psavert", "unemploy")  # 변수명 바꾸기
head(eco2)

dygraph(eco2) %>% dyRangeSelector()
