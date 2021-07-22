library(stringr)
library(ggplot2)

install.packages("glue")
library(glue)


# NA 처리; is.na()
df <- data.frame(id=c(1,2,NA,4,NA,6),
                 score=c(20,30,NA,50,60,NA),
                 gender=c("M","Z","M","F","^^","F"),
                 stringsAsFactors = FALSE)
df
is.na(df)
is.na(df$id)
is.na(df$score)

library(dplyr)
# NA 처리; id가 NA인 row 삭제
result <- df %>% filter(!is.na(df$id))
result
result2 <- df %>% filter(!is.na(df$id), !is.na(df$score))
result2

# NA 처리; NA 모두 삭제
result <- na.omit(df)
result

# NA 처리; NA를 무시하고 결과내기
mean(df$id)
## NA가 섞여있으면 모든 수치결과는 NA
mean(df$id, na.rm = TRUE)
# score안에 NA를 제거한 모든 값의 평균으로 대체해서 새로운 df 생성
df$score <- ifelse(is.na(df$score),
                   mean(df$score, na.rm = TRUE),
                   df$score)
df
# 이상치를 NA로 변환
df$gender <- ifelse(df$gender %in% c("M", "F"),
                    df$gender,
                    NA)
df$gender
###################################################

# Graph
## 2차원 그래프를 ggplot2를 이용해서 만들기

# 1. 산점도( Scatter plot); 2차원 평면(x,y)에 점으로 표현
# (1). x/y축 설정
# (2). 실제 그래프 추가(선/점/막대)
# (3). 축범위, 색 등등 설정

mpg
df <- as.data.frame(mpg)
df

## x/y축 설정
ggplot(data=df,
       aes(x=displ, y=hwy)) +
  geom_point() +
  xlim(3,6) +
  ylim(20,40)

## 막대그래프
result <- df %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy))
result

ggplot(data=result,
       aes(x=drv, y=mean_hwy)) +
  geom_col()

## boxplot; 사분위, 평균, 최대최소, 등등
ggplot(data=df,
       aes(x=drv, y=hwy)) +
  geom_boxplot()

# 문자열처리, 워드 클라우드
# 한글 형태소 분석
# KONLP(Korean Natural Language Process)
install.packages("KONLP")
## 설치 안돼면 library 폴더에 복사해서 설치
.libPaths() # 경로확인
library(KoNLP)
library(stringr)
useNIADic()
txt <- readLines("data/hiphop.txt",
                 encoding = "UTF-8")

words <- extractNoun(txt)
result <- unlist(words)

# 빈도; table();
wordcnt <- table(result)
wordcnt_df <- as.data.frame(wordcnt, stringsAsFactors = FALSE)
word_df <- wordcnt_df %>% filter(nchar(result) >=2) %>% arrange(desc(Freq)) %>% head(20)

##############################################
install.packages("wordcloud")
library(wordcloud)

# 색상 구분 설정
pal <- brewer.pal(8, "Pastel1")
# wordcloud는 생성시 항상 다르게 나온다. 시드값 설정을 해야 fix.
set.seed(1)
wordcloud(word=word_df$result,
          freq=word_df$Freq,
          min.freq = 2,
          max.words = 200,
          random.order = F,
          rot.per = .1,
          colors = pal)
wordcl
################################################
# 1. mpg data set 이용해서 8개 문제 해결 (dplyr)
# 2. 웹 스크래핑
# 3. 네이버 영화 댓글 사이트 특정 영화 댓글 수집, wordcloud 생성

require(rvest)

movie_comments <- list(length(10000))

for(i in 1:1000){
  for(j in 1:10){
# scraping 할 url
url <- "https://movie.naver.com/movie/point/af/list.nhn?st=mcode&sword=92075&target=after&page="
request_url <- str_c(url, i)
page_html <- read_html(request_url,  encoding = "CP949")
nodes = html_nodes(page_html, " td.title > a.report")
movie_comment <- html_attrs(nodes)

test2<-str_extract_all(movie_comment, "=', '.*?', '")
test3<-str_remove_all(test2, "[=',']")
# movie_comments<-str_remove_all(test3, "', '")

movie_comments[i][[j]] <- str_trim(test3, side = "both")
  }
}

capture.output(movie_comments,
               file = "data/comments_bck.txt",
               # Encoding("UTF-8"),
               append = TRUE)

# 미리 받은 10000개의 데이터
movie_comments <- readLines("data/comments_utf_tail.txt", encoding = "UTF-8")
text01 <- extractNoun(movie_comments)
capture.output(text01,
               file = "data/extractNoun_bck.txt",
               append = TRUE)

result <- unlist(text01)
cat(result, file = "data/cat_text.txt", append = TRUE)

comment_cnt <- table(result)
comment_cnt_df <- as.data.frame(comment_cnt, stringsAsFactors = FALSE)
comment_df <- comment_cnt_df %>% filter(nchar(result) >=2) %>% arrange(desc(Freq))

wordcloud(word=comment_df$result,
          freq=comment_df$Freq,
          min.freq = 2,
          max.words = 200,
          random.order = F,
          rot.per = .1,
          colors = pal)
