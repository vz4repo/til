menus = ["전남 시래기", "양자강", "20층", "아티제", "안먹어"]

# 1. for
for menu in menus:
#for 돌꺼야. 이름은 menu, 위치는 menus 안 in.
    print(menu)
print("===========")
# 2. for + index
for i in range(4):
#위와 비슷, range 함수 사용
    print(i)
    print(menu[i])

#range를 확인하고 싶다?
print(range(4))