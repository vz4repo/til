import requests
from bs4 import BeautifulSoup as bs



url = "https://finance.naver.com/sise/"
response = requests.get(url).text
# bs는 보기 편하게 해주는 기능
soup = bs(response, 'html.parser')
# 원하는 값의 ID나 CLASS를 '' 안에 넣는다
kospi_now = soup.select_one('#KOSPI_now')

print(kospi_now)