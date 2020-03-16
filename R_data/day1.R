# 다른 데이터 타입도 들어가는 자료구조

# matrix: 행렬, 2차원 구성, 같은 데이터 타입만
var1 <- matrix(c(1:5))
var1

var2 <- matrix(c(1:12), nrow=2)
var2

#recycle
var3 <- matrix(c(1:13),
               nrow = 3)
var3

var4 <- matrix(c(1:15),
               nrow = 3,
               byrow = TRUE)
var4
