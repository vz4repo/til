package day03;

public class Test06 {
	public static void main(String[] args) {
		// 반복처리
		// 초기값설정;조건식;증감식
		for (int i = 0; i < 3; i++) {
			System.out.println("hello java " + i);
		}
		System.out.println("----------------------");
		int sum = 0;
		for (int i = 1; i <= 100; i++) {
			if (i % 2 == 1) {
				System.out.print(i + "+");
				sum += i;
			}
		}
		System.out.println();
		System.out.println(sum);
		System.out.println("================================");
		String name = "홍길동";
		System.out.println(name.charAt(0)+"**");
		
        String msg = "hello java";
        System.out.println(msg);
		for(int i=msg.length()-1;i>=0;i--) {
			System.out.print(msg.charAt(i));
		}
		
	}
}











