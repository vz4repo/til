require(rvest)
require(stringr)
require(KoNLP)
require(dplyr)
library(ggplot2)

useNIADic()

movie_comments <- list(length(250)) 

for(i in 1:5){
    # scraping 할 url
    url <- "https://movie.naver.com/movie/point/af/list.nhn?st=mcode&sword=92075&target=after&page="
    request_url <- str_c(url, i)
    page_html <- read_html(request_url,  encoding = "CP949")
    nodes = html_nodes(page_html, " td.title > a.report")
    movie_comment <- html_attrs(nodes)
  
    split_comment <- str_split(movie_comment, ' ,') 
    for(j in 1:10){
    movie_comments[[i]] <- split_comment[[j]][3]
    }
}

comment_list_trim<- str_trim(movie_comments, side = "both")
comment_list_replace <- ifelse(comment_list_trim %in% "''",
                               NA,
                               comment_list_trim)


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
