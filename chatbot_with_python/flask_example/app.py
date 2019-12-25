from flask import Flask, render_template, request
#flask 안에 있는 render_template. 
#flast 안에 있는 request; input으로 받고싶다면..
import datetime
import random
#Flask 서버의 이름을 app으로 지정
app = Flask(__name__)

# url을 관리하는 라인 > @app.route("/")
@app.route("/")
#함수 시작
def hello():
    return "ㅎㅇㅎㅇ요"

@app.route("/dday")
def dday():
    today = datetime.datetime.now()
    print(today)
    final = datetime.datetime(2020, 6, 9)
    print(final)
    result = final - today
    print(result)
    return f"{result.days}days left. TT"

@app.route("/d_day")
def d_day():
    today = datetime.datetime.now()
    first = datetime.datetime(2019, 12, 14)
    result = today - first
    return f"{result.days}days after. ☆"

#is it chirstmas??
@app.route("/xmas")
def xmas():
    today = datetime.datetime.now()
    xday = datetime.datetime(today.year, 12, 25)
    result = xday.day - today.day
    if(today.day - xday.day == 0):
        return f"<h1>HAPPY X-MAS</h1>"
    else:
        return  f"<h1>{result} days left sorry...</h1>"
#strftime() customize date
#HTML 태그 삽입도 된다.

@app.route("/movies")
#flask로 app을 만들어서 '길(route)' 을 만드는 과정
def movies():
    movies = ["Inception", "Frozen2", "Netflix","Love in Christmas", "About time", "Home Alone I", "백두산"]
    return render_template("movies.html", movies=movies, text="영 화  목 록")



# string, int값의 변수를 받고 싶다면..
@app.route("/greeting/<name>")
def greeting(name):
    return f"Hi, hi~ \nyou must be <h1>{name}</h1> !!"

@app.route("/cube/<int:num>")
def cube(num):
    result = num ** 3
    return str(result)

# 식사 메뉴 추천
# 1. random
# 2. Dynamic Routing: @app.route("/lunch/[1,2,3,4]")
    # - List : ["짜장면", "짬뽕", "오므라이스", "볶음밥", "유린기", "사천탕수육", "꽝, "간짜장"]
    # - 받는 숫자 만큼 메뉴를 뽑는다.

@app.route("/lunch/<int:num>")
def lunch(num):
    menu = ["1", "2", "3", "4", "5", "6", "7", "8"]
    return render_template("movies.html", movies=menu, text="영 화  목 록")
# 다른 방법 02
# @app.route("/lunch/<int:num>")
# def lunch(num):
#     menu = ["짜장면", "짬뽕", "오므라이스", "볶음밥", "유린기", "사천탕수육", "꽝", "간짜장"]
#     c_menu = random.sample(menu, num)
#     return str(c_menu)    
    #range 대신 munu[List]를 넣으면 된다.

# 다른 방법 03
# @app.route("/lunch/<int:num>")
# def lunch(num):
#     menu = ["1", "2", "3", "4", "5", "6", "7", "8"]
#     c_menu = []
#     #최종 return 할 빈 배열 먼저
#     r_index = random.sample(range(0,8), num)
#     # 랜덤으로 뽑힌 숫자들
#     # 음식 숫자가 8개라서 range(0,7)가 아니라 8개면 range(0,8)로 해야한다.
#     for i in r_index:
#         c_menu.append(menu[i])
#     return str(c_menu)

@app.route("/vonvon")
def vonvon():
    return render_template("vonvon.html")

@app.route("/godmademe")
def godmademe():
    name = request.args.get("name")
    
    first_list = ["suger", "salt", "pepper", "red pepper"]
    second_list = ["피망", "파프리카", "타임", "로즈마리"]
    third_list = ["Coffe", "Tea", "Black tea", "Green tea"]

    first = random.choice(first_list)
    second = random.choice(second_list)
    third = random.choice(third_list)
    
    return render_template("godmademe.html", name=name, first=first, second=second, third=third)


#디버그 모드. 실시간 반영. 가장 밑으로 내려서 수정 안되게끔
# Debug Mode > python app.py 로 접근해야 ON
# SyntaxError: invalid syntax 뜨면 강종
if __name__ == "__main__":
    app.run(debug=True)