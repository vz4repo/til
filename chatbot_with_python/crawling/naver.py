'''
1. requests > naver.com: save to response
2. response > bs4: parse
3. browser
'''

import requests
from bs4 import BeautifulSoup as bs

import webbrowser

url = "https://www.naver.com"
response = requests.get(url).text

# 'html.parser' > 받아올 형식
# doc = bs(response, 'html.parser')
# result = doc.select_one('ah_k')
# print(result)

# 위와는 다른 방식으로
doc = bs(response, 'html.parser')
result = doc.select('.ah_k')
print(result)


search_url = "https://search.naver.com/search.naver?where=nexearch&query="
for i in range(5):
    webbrowser.open(search_url + result[i].text)
    # print(result[i].text)

# 여기까지 스크랩핑

