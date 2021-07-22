package day08;

public class testCircle {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Circle_a a= new Circle_a();
		System.out.println(a.cArea(6));
		a.print();
		a.color="blue";
		System.out.println(a.color);
		
		Circle_i i = new Circle_i();
		System.out.println(a.cArea(7));
	//	i.color="yellow";
		System.out.println(i.color);
	}
}
class Circle_a extends Shape_a{

	@Override
	public double cArea(double r) {
		// TODO Auto-generated method stub
		return Math.PI*r*r;
	}
}


abstract class Shape_a{
	String color;
	public abstract double cArea(double r);
	public void print() {}
}

interface Shape_i{
	final static String color = "red";
	public double cArea(double r);
}

class Circle_i implements Shape_i{
	@Override
	public double cArea(double r) {
		// TODO Auto-generated method stub
		return Math.PI*r*r;
}
}