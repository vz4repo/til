package day10;

public class test02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
Employee2<String,String> emp1 = new Employee2("Hong", "20191213");
System.out.println(emp1);
		*/
Employee2<String, Integer> emp2 = new Employee2("Ko", 20191213);
System.out.println(emp2.number/1000);

Employee2<String, Double> emp3 = new Employee2("Ko", 2019121.00);
System.out.println(emp3);

Employee2 emp4 = new Employee2("Ko", 194232);
System.out.println(emp4);
System.out.println(emp4.number.getClass());
	}

}

class Employee2<T,P extends Number>{
	//막무가내로 object만 쓰면 헷갈린다.
	T name;
	P number;
	//Eclips 자동 완성 기능; 생성자, toString
	public Employee2(T name, P number) {
		super();
		this.name = name;
		this.number = number;
	}
	@Override
	public String toString() {
		return "Employee2 [name=" + name + ", number=" + number + "]";
	}
	
}