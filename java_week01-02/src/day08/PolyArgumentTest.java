package day08;

public class PolyArgumentTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
Buyer brown = new Buyer();
brown.buy(new TV_b());
brown.buy(new Computer());
brown.buy(new Speaker());


	}

}

class Product_b{
	int price;
	int bonusPoint;
	Product_b(int price){
		this.price=price;
		bonusPoint = (int)(price/10.0);
	}
	
	
}
class TV_b extends Product_b{
	TV_b(){
	super(100);
	}
	public String toString() {return "TV";}
}

class Computer extends Product_b{
Computer(){
	super(200);
	}
	public String toString() {return "PC";}
}
class Speaker extends Product_b{
	Speaker(){
		super(900);
		}
		public String toString() {return "Speakers";}
}


class Buyer{
	int money = 1000;
	int bonusPoint = 0;
	
	void buy(Product_b items) {
		if (money < items.price) {
			System.out.println("not enough for "+items+".");
			return ;
		}
		money = money - items.price;
		bonusPoint = items.bonusPoint;
		System.out.println(items+" confirmed.");
		System.out.println("you have "+money+" left.");
		System.out.println("your point is "+bonusPoint+" now.");
		return;
	}
}