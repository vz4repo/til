package day08;

public class test04 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
String msg1 = "hellod";
String msg2 = "hellod";
System.out.println(msg1+" "+msg2);
System.out.println(msg1.equals(msg2));

Person p1 = new Person("홍길돋", 22);
Person p2 = new Person("홍길돋", 22);
System.out.println(p1+" "+p2);
System.out.println(p1.equals(p2));

/*
System.out.println(msg1.toString());
System.out.println(msg2);
System.out.println(p1);

Object obj = msg1;
System.out.println(obj);
*/
	}
}

