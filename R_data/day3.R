# R에서 외부 Web Application 호출 후 결과를 Data Frame 형태로 받아오기
# json 핸들링하는 외부 package 이용하기
install.packages("jsonlite")
install.packages("curl")
# json 처리
require(jsonlite)
# 문자열 처리
require(stringr)

url <- "http://localhost:7070/bookSearch/search?keyword="
request_url <- str_c(url, scan(what = character()))
request_url

# 해당 주소를 열고 json파일 형식으로 받고 Data Frame 형식으로 저장한다
df <- fromJSON(request_url) 
View(df)

for(i in 1:nrow(df)){
  print(df$title[i])
}

##############################################

# 외부 open API 사용하기; 영화진흥위원회
# key: 7eb1c8a10cf2812f6edb201cef2230c5
url <- "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=7eb1c8a10cf2812f6edb201cef2230c5&targetDt=20200310"

df <- fromJSON(url)
View(df)

# df는 list 형식으로 받았다; 잘 쪼개서 찾아가자
df[[1]]
df[["boxOfficeResult"]]
df$boxOfficeResult
df$boxOfficeResult$dailyBoxOfficeList$movieNm

##############################################

# Web scraping w/ css.jQuery(selector), XPATH

# 네이버영화 댓글 페이지 scraping; 그에 필요한 패키지
install.packages("rvest")
require(rvest)
require(stringr)
# scraping 할 url
url <- "https://movie.naver.com/movie/point/af/list.nhn?&page="
request_url <- str_c(url, 1)
request_url
page_html <- read_html(request_url,
                       encoding = "CP949")
page_html

nodes = html_nodes(page_html, "td.title > a.movie.color_b")
nodes1 = html_nodes(page_html, "td.title > div > em")
nodes2 = html_nodes(page_html, " td.title > a.report")

movie_title <- html_text(nodes)
movie_score <- html_text(nodes1)
movie_comment <- html_attrs(nodes2)

# test1<-str_extract_all(movie_comment, "href.*")
# test2<-str_split(test1,',')
# str_remove_all(test2, "&amp;#39;")
# test2[[1]][[3]]
test2<-str_extract_all(movie_comment, "=', '.*?', '")
test3<-str_remove_all(test2, "[=',']")
movie_comments<-str_remove_all(test3, "', '")

movie_title
movie_score
movie_comments

review <- str_c( movie_title, " ",
                 movie_score, "점 ",
                 movie_comments)
review
