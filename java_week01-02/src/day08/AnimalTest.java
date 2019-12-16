package day08;

public class AnimalTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Animal[] animals = {
				new Dog("White", "Karry"),
				new Fish("kuku"),
		};
		for(Animal data:animals) {
			data.breath();
		}
	}

}
