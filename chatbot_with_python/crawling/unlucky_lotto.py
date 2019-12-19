# 일괄 주석 ctrl+/
# 내장라이브러리
import random
import json
# 외부라이브러리
import requests
# beautifulSoup만 갖고 오고 싶다. 이름은 bs로.
from bs4 import BeautifulSoup as bs

nums = random.sample(range(1,46), 6)
# 1번에서 46번까지의 range
# 그 중에서 6개
print(nums)

url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=836"
response = requests.get(url)
# print(response.text)

lotto = json.loads(response.text)
# json 형식을 dict 로 변환
# print(lotto)

# 이 둘의 차이점. get 붙인거 쓰면 에러가 안난다....??
# print(lotto["drwtNo3"])
# print(lotto.get("drwtNo3"))

winner = []
for i in range(1, 7):
    winner.append(lotto.get(f"drwtNo{i}"))

print(winner)
# import requests

# response = requests.get("https://www.naver.com")
# #response = requests.get("https://www.naver.com").txt
# #보기 힘드니까 bs4 설치
# print(response)
# # <Response [200]> - 정상
# # HTTP response status codes
# print(response.text)