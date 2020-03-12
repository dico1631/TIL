if (!require(maps)) install.packages("maps")
if (!require(ggplot2)) install.packages("ggplot2")
if (!require(dplyr)) install.packages("dplyr")
install.packages("mapproj")

asia = map_data('world',
                region = c('Japan', 'China', 
                           'North Korea', 'South Korea'))
str(asia)
# world map에서 subregion으로 위 region 벡터를 region으로 갖는다.

asia %>% group_by(region, group) %>%
  summarise(n=n()) %>%
  filter(region == "South Korea")

# group마다 따로 polygon을 생성하기 위해 group 옵션을 설정한다.
ggplot(asia, aes(x=long, y=lat, group=group)) + 
  geom_polygon(fill = 'white', color='black') +
  coord_map() # metacator 투영법

## geocoding : 주소 ==> 위도, 경도
# install.packages('ggmap')
# library(ggmap)
# library(help=ggmap) # 2.6.1
# remove.packages("ggmap")
# 
# # -- geocode failed with status OVER_QUERY_LIMIT, location = "Seoul"
# # -- solve : https://stackoverflow.com/questions/36175529/getting-over-query-limit-after-one-request-with-geocode%E2%80%8B

# -- install ggmap 2.7 : https://kuduz.tistory.com/1092
if (!require(devtools)) install.packages("devtools")
# install_github('dkahle/ggmap') # None 설정
if (!require(stringi)) install.packages("stringi")
if (!require(ggmap)) install.packages("ggmap")

# go to : https://cloud.google.com/maps-platform/#get-started

register_google(key="AIzaSyAvL1mI-IJ0XN-w3HLVAe1Z8mp0KAFIFTg")

# ggmap 가이드 : https://mrkevinna.github.io/R-%EC%8B%9C%EA%B0%81%ED%99%94-3/
geocode('Seoul', source='google')
geocode('Seoul', source='google', output='more')
geocode(enc2utf8('서울'), source='google')
geocode(enc2utf8('신림역&language=ko'), source='google', output='more')

station_list = c("시청역", "을지로입구역", "을지로3가역", "을지로4가역", 
                 "동대문역사문화공원역", "신당역", "상왕십리역", "왕십리역",
                 "한양대역", "뚝섬역", "성수역", "건대입구역", "구의역", "강변역",
                 "잠실나루역", "잠실역", "잠실새내역", "잠실종합운동장역", "삼성역",
                 "선릉역", "역삼역", "강남역", "교대역", "서초역", "방배역",
                 "사당역", "낙성대역", "서울대입구역", "봉천역", "신림역", "신대방역",
                 "구로디지털단지역", "대림역", "신도림역", "문래역", "영등포구청역",
                 "당산역", "합정역", "홍대입구역", "신촌역", "이대입구역", "아현역",
                 "충정로역")
station_df = data.frame(station_list, stringsAsFactors = F)
station_df$station_list = enc2utf8(station_df$station_list)
station_lonlat = mutate_geocode(station_df, station_list, source="google")
head(station_lonlat)
class(station_lonlat)

# -- ggmap::qmap : 지도 그리기(google)
qmap('seoul', zoom = 11)
qmap('seoul', zoom = 11, color='bw')


qmap('seoul', zoom = 11, maptype='roadmap')
qmap('seoul', zoom = 11, maptype='satellite')
qmap('seoul', zoom = 17, maptype='hybrid')
qmap('seoul', zoom = 11, source='stamen', maptype='watercolor')
qmap('seoul', zoom = 11, source='stamen', maptype='toner')

## - 특정 lon, lat를 중심으로 지도 그리기 
seoul_lonlat = unlist(geocode('seoul', source='google'))
class(seoul_lonlat)
names(seoul_lonlat)

qmap(seoul_lonlat, zoom=11, source='stamen', maptype='toner')

## - mapping with ggmap + ggplot2
seoul_map <- qmap(seoul_lonlat, zoom=11, source='stamen', maptype='toner')
seoul_map + geom_point(data=station_lonlat, 
                       aes(x=lon, y=lat),
                       colour = 'green',
                       size=3)

# http://wififree.kr/open_api.do#n
if (!require(readxl)) install.packages("readxl")
wifi_data <- read_excel("Data/wifi_data.xlsx", 
                        col_names = T, sheet=1)
class(wifi_data)
## - "tbl_df"인 data.frame인 경우 df[,1]등이 vector가 아닌 data.frame이 된다.

# str(statiston_lonlat)
# station_lonlat[,2]
# str(wifi_data)
# wifi_data[,1]

wifi_data <- as.data.frame(wifi_data)
class(wifi_data)

head(wifi_data)
names(wifi_data)
## - 현재 변수명을 변수 label로 지정하고, 영문 변수명을 생성하자.
cNames <- c("telecom", "position", "p_class", "p_global", "p_local", "p_addr",
            "p_addr2", "p_E", "p_Eglobal", "p_Elocal", "p_Eaddr", "p_Eaddr2", 
            "lat", "lon")
cLabel <- names(wifi_data)
cLabel[3] = "장소 분류"
names(wifi_data) <- cNames
head(wifi_data)

## - wifi_data의 각 열에 labelling.
if (!require(Hmisc)) install.packages("Hmisc")

wifi_data[,2]
# for(i in 1:14){...}
for(i in 1:dim(wifi_data)[2]){
  label(wifi_data[,i]) <- cLabel[i]
}
View(wifi_data[1:2,])

## - 서울특별시와 국문 변수들만 가져오자.
wifi_data<-wifi_data[wifi_data[,4]=="서울특별시",
                     c(1:6, 13:14)]
# wifi_data<-wifi_data %>% select(colnames(wifi_data)
#                      [1,2,3,4,5,6,13,14]) %>%
#   filter(p_global == "서울특별시")

table(wifi_data$p_class)
table(is.na(wifi_data$lon))

## - lon, lat 변수에 대해 소수점 4째자리, 5째 자리에서 반올림할까?
# wifi_data$lon <- round(wifi_data$lon, 4)
# head(wifi_data$lon)
# wifi_data$lat <- round(wifi_data$lat, 5)
# head(wifi_data$lat)


# 통신사별로 지도에 표시해보자.
seoul_map + geom_point(data = wifi_data, aes(x=lon, y=lat)) +
  facet_wrap(~telecom)

## - ..level..: 등고선, ..density..: 밀도 등
## - https://stackoverflow.com/questions/32206623/what-does-level-mean-in-ggplotstat-density2d
seoul_map + geom_polygon(data=wifi_data,
                         aes(x=lon, y=lat, fill=..level..),
                         stat = 'density2d',
                         alpha=0.3) +
  scale_fill_gradient(low='#C6DBEF', high='#08306B') +
  facet_wrap(~telecom)

# - mapping with leaflet : OpenStreetMap
if (!require(leaflet)) install.packages("leaflet")

leaflet(wifi_data) %>%
  setView(lng = seoul_lonlat[1],
          lat = seoul_lonlat[2],
          zoom = 11) %>%
  addTiles() %>%          # map widget에 그래픽 요소와 레이어를 추가.
  addCircles(lng = ~ lon, lat = ~lat) # 지도에 circle point를 추가.

## - 다양한 map provider의 basemap 활용하기
leaflet::providers

leaflet(wifi_data) %>%
  setView(lng = seoul_lonlat[1],
          lat = seoul_lonlat[2],
          zoom = 11) %>%
  addProviderTiles(providers$Stamen.Toner) %>%  # map 제공자로부터 basemap을 추가.
  addCircles(lng = ~ lon, lat = ~lat)

# 직접 명칭을 입력할 수도 있다.
leaflet(wifi_data) %>%
  setView(lng = seoul_lonlat[1],
          lat = seoul_lonlat[2],
          zoom = 11) %>%
  addProviderTiles(providers$Esri.NatGeoWorldMap) %>%
  addCircles(lng = ~ lon, lat = ~lat)

leaflet(wifi_data) %>%
  setView(lng = seoul_lonlat[1],
          lat = seoul_lonlat[2],
          zoom = 11) %>%
  addProviderTiles(providers$Stamen.Toner) %>%
  addCircles(lng = ~ lon, lat = ~lat, popup = ~telecom)

## - telecom 마다 다른 색을 입히자.
if (!require(graphics)) install.packages("graphics")

rcols <- rainbow(length(unique(wifi_data$telecom)), alpha = NULL)
wifi_data$cols <- rcols[factor(wifi_data$telecom)]

leaflet(wifi_data) %>%
  setView(lng = seoul_lonlat[1],
          lat = seoul_lonlat[2],
          zoom = 12) %>%
  addProviderTiles(providers$Stamen.Toner) %>%
  addCircleMarkers(lng = ~ lon, lat = ~lat, popup = ~telecom, 
                   radius = 2  ,color = ~ cols)



# -----optional: many other graphics packages ----------#
if (!require(networkD3)) install.packages("networkD3")

data(MisLinks, MisNodes)

forceNetwork(Links=MisLinks, Nodes=MisNodes,
             Source = 'source', Target = 'target',
             Value = 'value',
             NodeID = 'name', Group = 'group',
             opacity = 0.6)

if (!require(d3heatmap)) install.packages("d3heatmap")

d3heatmap(mtcars, scale="column", colors="Blues")

install.packages('DT')
library(DT)
datatable(iris)
