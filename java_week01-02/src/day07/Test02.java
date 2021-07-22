package day07;

public class Test02 {
	public static void main(String[] args) {
		// is a 관계
        // 모든 객체의 데이터 타입은 부모가 될수 있다.
        // 필요하면 upcasting  downcasting을 유도 한다.
		
		Object a = new Animal();
        ((Animal)a).breath();
        
		Animal a2 = new Animal();
		a2.breath();
		
		Object obj = a2;
		Animal temp = (Animal)obj;
		temp.breath();
		
		Dog d =  new Dog();
		System.out.println(d.kind);
        Object obj2 = d;
        Animal a3 = (Animal)obj2;
        Dog d3 = (Dog)obj2;
        System.out.println(a3.kind);
        System.out.println(d3.kind);
        
        System.out.println("=============================");
        
        String msg = "hello java";
        Object obj7 = d;
        
        if(obj7 instanceof Dog)
        System.out.println(((Dog)obj7).kind);

        if(obj7 instanceof Animal)
        System.out.println(((Animal)obj7).kind);
        
        if(obj7 instanceof String)
        System.out.println(((String)obj7).toUpperCase());
        
	}
}





