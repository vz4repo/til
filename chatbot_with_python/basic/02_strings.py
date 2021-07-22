'''
string 조작하기
1. 글자 합치기
2. 글자 삽입(수술)
3. 글자 자르기 
'''

# 1. 글자 합치기
variable = "아무말" + " " +'심한말'
print(variable)

# 2. 글자 삽입(수술)
name = 'Hr'
age = 50
text = "ㅎㅇㅎㅇ요, im {}! \nand im {} years-old".format(name, age)
# .fotmat 은 예전 방식
# end of quotation mark + .format(agr[0], arg[1])
print(text)

f_text = f"hihi, 나는 {name}! \nand im {age} 늙었다."
# f-string 라고 불리는 요즘 쓰는 string
print(f_text)

# 3. 글자 자르기
# string > "어쩌고글자들"[start:end]
text_name = text[:15]
#0부터 15까지
print(text_name)
text_age = text[18:]
#18부터 끝까지
print(text_age)

text_split = text.split()
#list로 한 단어씩 쪼개진다
print(text_split)