package day08;
import day07.Animal;
public class test01 {

	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
Animal a = new Animal();

	}

}

class Dog2 extends Animal{
	public void print() {
		System.out.println(super.kind);
		//protected 
	}
}