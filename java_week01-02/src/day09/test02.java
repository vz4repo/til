package day09;

public class test02{
	public static void main(String[] args) {		
		// A a = new A(); 결과값 비교해보기

		A a = new A("Ukonw");
		a.print();
		
		A.B b1 = a.new B();
		b1.print();
	
		//Inner class는 Outer class의 주소가 필요하다.
		A.B b = new A().new B();
		b.print();
	}
}


class A{
	String name = "unknown";

	public A() {}
	public A(String name) {
		super();
		this.name = name;
	}
	void print() {
		System.out.println(name.charAt(0)+"**");
	}
	class B{
		void print() {
			System.out.println(name);
		}
	}
}



/*
 * ################## 스프링 프레임워크에서 배울 내용 ##############{
		public static void main(String[] args) {
		B b = new B(new A());
		b.printt();
	}
}
*/
/*
class A{
	//String Name = "unknown";
	//setter, getter 설정
	String Name;
	//#########################    미완    ######################	
}
class B{
	
	 // A a;
	 // null exception 발생
	/*
	Exception in thread "main" java.lang.NullPointerException
	at day09.B.printt(test02.java:23)
	at day09.test02.main(test02.java:6)
	 */
	
	//A a = new A();
	//이러면 객체 값을 못바꾼다.

	/*
	A a
	public B(A a) {
		super();
		this.a = a;
	}
	public A getA() {
		return a;
	}
	public void setA(A a) {
		this.a = a;
	}
	void printt() {
		//System.out.println("name: "+Name);
		//그냥 name쓰면 local 변수 검색 쭉 하고 못찾아서 에러.
		System.out.println("name: "+a.Name);
	}	
}
	 */
