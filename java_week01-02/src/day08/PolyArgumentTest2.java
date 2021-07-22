package day08;

public class PolyArgumentTest2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
Buyer_k Ray = new Buyer_k();
Ray.buy(new TV_k());
Ray.buy(new Computer_k());
Ray.buy(new Speaker_k());
Ray.buy(new Audio_k());
Ray.buy(new Light_k());
Ray.summary();

	}

}

class Product_k{
	int price;
	int bonusPoint;
	
	Product_k(int price){
		this.price=price;
		bonusPoint=(int)(price/10.0);
	}
	Product_k(){}
}

class TV_k extends Product_k{
	TV_k(){
	super(100);
	}
	public String toString() {return "TV";}
}

class Computer_k extends Product_k{
Computer_k(){
	super(200);
	}
	public String toString() {return "PC";}
}
class Speaker_k extends Product_k{
	Speaker_k(){
		super(200);
		}
		public String toString() {return "Speakers";}
}
class Light_k extends Product_k{
	Light_k(){
		super(300);
		}
		public String toString() {return "Lights";}
}
class Audio_k extends Product_k{
	Audio_k(){
		super(700);
		}
		public String toString() {return "Audio Components";}
}



class Buyer_k{
	int money = 1000;
	int bonusPoint = 0;
	Product_k[] item = new Product_k[10];
	int i = 0;
	
	void buy(Product_k products) {
		if (money < products.price) {
			System.out.println("not enough for "+products+".");
			return;
		}
		money -= products.price;
		bonusPoint += products.bonusPoint;
		//System.out.println("#### "+i+" ####");
		item[i++] = products;
		//System.out.println("#### "+i+" ####");
		System.out.println(products+" confirm.");
	}
	
	void summary() {
		int sum = 0;
		String itemList = "";
		for(int i = 0; i<item.length; i++) {
			if(item[i] == null) break;
			sum = sum + item[i].price;
			itemList = itemList + item[i] + ", "; 
		}
		System.out.println("it's total "+sum+" USD.");
		System.out.println("You have "+itemList+".");
		
	}
}
