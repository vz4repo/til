package day07;

public class Test01 {
	public static void main(String[] args) {
        Dog d = new Dog();
        d.print();
        
        //main 에서는 this  super 키워드 사용 할수 없다.
        System.out.println(d.kind);
        System.out.println(d.getSuperKind());
        
        
        //is a 관계
        // 모든 객체의 데이터 타입은 부모가 될수 있다.
        
        
        
	}
}


