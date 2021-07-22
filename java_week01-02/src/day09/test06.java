package day09;

public class test06 {

	public static void main(String[] args) {
System.out.println("start");


String msg = "-5";
// msg = "string";  -> NumberFormatException
// msg = "0"; -> ArithmeticException
int num = 0;
int res = 0;

try {
num = Integer.parseInt(msg);
res = 1000/num;
// 여기선 finally 금지. 예외 뜨면 바로 catch로 넘어가고 자원반납 안한다.
int[] number = new int[num];
}catch (NumberFormatException e) {
	System.out.println("###  warning  ###\n"+e);
	System.out.println("Only numbers available.");
}catch (ArithmeticException e) {
	System.out.println("###  warning  ###\n"+e);
	System.out.println("put any number except Zero.");
}catch (Exception e) {
	System.out.println("###  warning  ###\n"+e);
	e.printStackTrace();
	
	System.out.println(e.getMessage());
	
	System.out.println(e);
	 


}
finally {
	System.out.println("자원반납코드 항상 수행");
}

System.out.println(num);
System.out.println(res);
System.out.println("\n\nend");

	}

}
