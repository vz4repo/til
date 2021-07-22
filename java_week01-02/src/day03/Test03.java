package day03;

import java.util.Scanner;

public class Test03 {
	public static void main(String[] args) {
		String name = null;
		int kor = 0;
		int math = 0;
		Scanner scanner = new Scanner(System.in);
		System.out.println("이름을 입력하세요_");
		name = scanner.nextLine();
		System.out.println(name.length());
		System.out.println("국어 점수를 입력하세요_");
		kor = Integer.parseInt(scanner.nextLine());
		System.out.println("수학 점수를 입력하세요_");
        math = scanner.nextInt();
        scanner.nextLine();
		
		System.out.printf("이름:%s,국어:%d,수학:%d %n",name,kor,math);
		double avg = (kor+math)/2.;
		System.out.println(avg+":"+(avg >=80?"합격":"불합격"));
		
		scanner.close();// 자원반납
		scanner = null; // gc의 대상 
		return;
	}
}
