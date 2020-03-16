# Data manuplating
# Data Frame 조작
install.packages("rvest")
library(rvest)
library(stringr)

# 긁어올 페이지 설정
url <- "https://movie.naver.com/movie/point/af/list.nhn?&page="
request_url <- str_c(url , "1")

# 접속해서 HTML 긁어오기
page_html <- read_html(request_url, encoding = "CP949")

# 부분만 추출해보자; tag찾기, attr 찾기 등등
# nodes <- html_nodes(page_html, "td.title > a.movie")

# movie_xpath <- '//*[@id="old_content"]/table/tbody/tr[1]/td[2]/a[1]'
movie_title <- vector( mode = "character", length = 10)
for(i in 1:10){
  myPath = str_c('//*[@id="old_content"]/table/tbody/tr[', i ,']/td[2]/a[1]/text()')

  nodes = html_nodes(page_html, xpath = myPath)
  movie_title[i] <- html_text(nodes)
  }

###############################################

# RottenTomatoes 2019 Movie Of The Year
url <- "https://www.rottentomatoes.com/top/bestofrt/?year=2019"
title_request <- read_html(url)
title_nodes <- html_nodes(title_request, "table.table a.articleLink")
title <- html_text(title_nodes)
title <- str_trim(title, side = "both")
title

# RottenTomatoes 2019 MOTY Rating & Genre
href <- html_attr(title_nodes, "href")
href_link <- str_c("https://www.rottentomatoes.com", href)

rating <- vector(mode = "character", length = 100)
genre <- list(length(100))

for (i in 1:100) {
  info_request <- read_html(href_link[i])
  info_rating_nodes <- html_nodes(info_request, "span.mop-ratings-wrap__percentage")
  info_genre_nodes <- html_nodes(info_request, str_c("li:nth-child(2) > div.meta-value"))
  
  rating[i] <- html_text(info_rating_nodes)
  genre[i] <- html_text(info_genre_nodes)
}
rating <- str_trim(rating, side = "both")
genre01 <- str_remove_all(genre, '\n')
# genre02 <- str_split(genre, ',')
# genre03 <- str_trim(genre, side = "both")
# genre04 <- str_replace_all(genre01, '  ', ' ')
genre05 <- str_replace_all(genre01, '  ', '')


result <- str_c(title,"  / ", rating, " / ", genre05)


####################################################

install.packages("ggplot2")
library(ggplot2)

View(mpg)

# data frame으로 변환
df  <- as.data.frame(mpg)
View(df)

# 1. class(); 자료구조 형식 확인
class(df)
# 2. ls(); data.frame의 cols만 출력; vector 형태
ls(df)
# 3. head(),tail(); data의 앞부분 일부만; 값을 개략적으로 확인 
head(df)
tail(df)
# 4. View(); view
# 5. dim(); 행, 열의 길이
dim(df)
# 6. nrow(), ncol(); row, col의 길이
# 7. str(); data.frame의 전반적인 정보
str(df)
# 8. length(); data.frame에서 cols의 개수 
length(df)
# 9. summary(); 숫자에 대한 간단한 통계치
summary(df)

# data.frame을 제어/조사에는 다른 외부패키지가 더 좋다
install.packages("dplyr")
library(dplyr)
library(xlsx)
# 예제 data.frame; .xlsx파일 하나...

excel_data <- read.xlsx(file.choose(),
                        sheetIndex = 1,
                        encoding = "UTF-8")
excel_data

# data.frame을 제어하는 특화된 함수 제공
# chainnig 지원해서 편하게!! data.frame 제어 가능 

# 1. rename(data frame, newVar = var)
df = rename(excel_data,
       Y17_AMT = AMT17,
       Y16_AMT = AMT16)
df

# 2. filter(data frame, 조건1, 조건2, 조건3, ...)
filter(excel_data, 
       SEX=='M',
       AREA %in% c('서울', '인천'))

# 3. arrange(data frame, 1차 column명, 2차 column명)
# 오름차순 default; 내림차순 desc; 정렬
arrange(excel_data, 
        desc(AGE),
        SEX)
df = filter(excel_data, 
            SEX=='M') %>%
    arrange(desc(AGE))
df  

# 4. select(data frame, column, column, column, ...)
# SQL 구문처럼 마지막 결과값에서 원하는 cloumn만 출력
df = filter(excel_data, 
            SEX=='M') %>%
  arrange(desc(AGE)) %>%
  select(ID, SEX, AREA)
df  
df = filter(excel_data, 
            SEX=='M') %>%
  arrange(desc(AGE)) %>%
  select(-ID, -SEX, AREA)
df  

# 5. mutate(data frame, 추가할 column = 수식, ...)
# ex) 원본에서 AMT17이 100,000 이상이면 VIP 등급 수여
df = filter(excel_data,
            SEX=='M') %>%
  mutate(VIP = AMT17 > 500000)
df

# 6. summarise(data frame, 추가할 column = 함수, ...)
df = summarise(excel_data,
               SUM17AMT = sum(AMT17), cnt=n())
df

# 7. group_by(data frame, 범주형 column)
# 범주형(factor) data
df = group_by(excel_data,
              SEX) %>%
  summarise(SUM17AMT = sum(AMT17), cnt=n())
df

# 8. bind_rows(df1, df2)
# data frame 합치기; column명은 같이

###################################################
# dplyr 연습
mpg = as.data.frame(mpg)

# 1. 자동차 배기량에 따라 고속도로 연비가 다른지 알아보려 한다. 
# displ(배기량)이 4 이하인 자동차와 5 이상인 자동차 중 
# 어떤 자동차의 hwy(고속도로 연비)가 평균적으로 더 높은지 확인하세요.
df <- mutate(mpg,
             diff = ifelse(displ <=4, "LOW", "HIGH")) %>%
  group_by(diff) %>%
  summarise(avg_hwy = mean(hwy))
df  
# 2. 자동차 제조 회사에 따라 도시 연비가 다른지 알아보려고 한다. 
# "audi"와 "toyota" 중 어느 manufacturer(제조회사)의 cty(도시 연비)가 
# 평균적으로 더 높은지 확인하세요.
df <- filter(mpg,
             manufacturer %in% c("audi", "toyota")) %>%
  group_by(manufacturer) %>%
  summarise(avg_cty = mean(cty))
df
# 3. "chevrolet", "ford", "honda" 자동차의 고속도로 연비 평균을 알아보려고 한다. 
# 이 회사들의 데이터를 추출한 후 hwy(고속도로 연비) 전체 평균을 구하세요.
df <- filter(mpg,
             manufacturer %in% c("chevrolet", "ford", "honda")) %>%
  group_by(manufacturer) %>%
  summarise(avg_hwy = mean(hwy))
df
# 4. "audi"에서 생산한 자동차 중에 어떤 자동차 모델의 hwy(고속도로 연비)가 
# 높은지 알아보려고 한다. "audi"에서 생산한 자동차 중 hwy가 1~5위에 해당하는 
# 자동차의 데이터를 출력하세요.
df <- filter(mpg,
             manufacturer == "audi") %>%
  arrange(desc(hwy)) %>%
  select(model, displ, hwy)
head(df, n=5)
# 5. mpg 데이터는 연비를 나타내는 변수가 2개입니다. 
# 두 변수를 각각 활용하는 대신 하나의 통합 연비 변수를 만들어 사용하려 합니다. 
# 평균 연비 변수는 두 연비(고속도로와 도시)의 평균을 이용합니다. 
# 회사별로 "suv" 자동차의 평균 연비를 구한후 내림차순으로 정렬한 후 1~5위까지 데이터를 출력하세요.
df <- group_by(mpg, manufacturer) %>%
  filter(class == "suv") %>%
   summarise( Impg = mean(hwy+cty), cnt=n())
df
# 6. mpg 데이터의 class는 "suv", "compact" 등 자동차의 특징에 따라 
# 일곱 종류로 분류한 변수입니다. 어떤 차종의 도시 연비가 높은지 비교하려 합니다. 
# class별 cty 평균을 구하고 cty 평균이 높은 순으로 정렬해 출력하세요.
df <- group_by(mpg, class) %>%
  summarise( AVG_cty = mean(cty)) %>%
  arrange(desc(AVG_cty))
df  
# 7. 어떤 회사 자동차의 hwy(고속도로 연비)가 가장 높은지 알아보려 합니다. 
# hwy(고속도로 연비) 평균이 가장 높은 회사 세 곳을 출력하세요.
df <- group_by(mpg, manufacturer) %>%
  summarise(AVG_hwy = mean(hwy))
head(df, n=3)
# 8. 어떤 회사에서 "compact" 차종을 가장 많이 생산하는지 알아보려고 합니다. 
# 각 회사별 "compact" 차종 수를 내림차순으로 정렬해 출력하세요.
df <- filter(mpg, class=="compact") %>%
  group_by(manufacturer) %>%
  summarise(cnt=n()) %>%
  arrange(desc(cnt))
df
