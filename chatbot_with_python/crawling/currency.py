#환율정보 가져오기

import requests
from bs4 import BeautifulSoup as bs

url = "https://finance.naver.com/marketindex/"
response = requests.get(url)
soup = bs(response.text, 'html.parser')

currency_now = soup.select_one('#exchangeList > li:nth-child(1) > a.head.usd > div > span.value')
currency_name = soup.select_one('#exchangeList > li:nth-child(1) > a.head.usd > h3 > span')
print(f"For {currency_name.text} currency exchange rate now : {currency_now.text}")
# .text를 안붙였을 경우
# print(f"For {currency_name} currency exchange rate now : {currency_now}")
# > For <span class="blind">미국 USD</span> currency exchange rate now : <span class="value">1,164.90</span>



# 파일 저장
# with는 스코프. 여기만 잠깐 쓰겠다.
with open('test.md', 'w', encoding='utf-8') as f:
    f.write(f"For {currency_name.text} currency exchange rate now : {currency_now.text}")