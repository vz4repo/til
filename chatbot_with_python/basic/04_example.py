# print() happy hacking
txt = "happy hacnking"
print(txt)
print(txt)
print(txt)
print(txt)
print(txt)


#점심메뉴
menu1 = "순남 시레기?"
menu2 = "양자강??"
menu3 = "20층~"

print(menu1)
print(menu2)
print(menu3)

#List 점심메뉴
menus = ["전남 시래기", "양자강", "20층", "아티제", "안먹어"]
print(menus)
print(menus[0])

#List  전화번호
phoneNums = ["02-231-123123", "1231323", "3567567", "2557532", "789678"]
print(phoneNums)

#Dictionary
dict_num = {"순남 시래기":"02-231-123123","양자강":"1231323", "20층":"3567567", "아티제":"2557532", "안먹어":"789678"}
print(dict_num)
print(dict_num["순남 시래기"])
print(dict_num.get("순남 시래기"))
# !! 오류발생 !! none
print(dict_num.get("순남 시래기  "))