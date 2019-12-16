package day10;

public class test01 {

	public static void main(String[] args) {
		// generics

		Employee<String> emp1 = new Employee("Hong", "20190001");
		System.out.println(emp1);
		System.out.println(emp1.number);
		
		Employee<Integer> emp2 = new Employee("Ko", 20190002);
		System.out.println(emp2);
		System.out.println(emp2.number);
		
		Employee emp3 = new Employee("Ko", 20190003);
		System.out.println(emp3);
		
		
		//System.out.println(emp3.number);
		//number쪽에 마우스올리고 ctrl+space 하면 타입을 알 수 있다.
		//<string>은 string, <integer>는 int, 아무것도 안쓰면 Object.		
		
	}

}


class Employee<T>{
	//T는 컴파일때 int 인지 string인지 타입체크를 한다.
	//객체의 타입안정성을 높이고 형변환의 번거로움을 줄인다.
	String name;
	T number;
	public Employee(String name, T number) {
		super();
		this.name = name;
		this.number = number;
	}
	@Override
	public String toString() {
		return "Employee [name=" + name + ", number=" + number + "]";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public T getNumber() {
		return number;
	}
	public void setNumber(T number) {
		this.number = number;
	}
	
}