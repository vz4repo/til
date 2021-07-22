package day04;

import java.io.FileInputStream;
import java.util.Scanner;

public class Test01_switch {
	public static void main(String[] args) throws Exception {
		System.out.println("App 시작 ...");
		String name = null;
		int kor,eng,math;
		Scanner scanner = 
		new Scanner(new FileInputStream("c://lib/score.txt"),"UTF-8");
		
		name = scanner.next();
		kor = scanner.nextInt();
		eng = scanner.nextInt();
		math = scanner.nextInt();
		scanner.nextLine();
		
		double sum = kor+eng+math;
		double avg = sum/3;
		
		System.out.printf("이름=%s %n",name);
		System.out.printf("국어=%d 영어=%d 수학=%d ",kor,eng,math);
		System.out.printf("평균=%.2f ",avg);
        //학점 처리  A B C D F
		char grade = 'F';
		
		switch((int)avg/10) {
		    case 10:
		    case  9:
		    	grade = 'A';
		    	break;
		    case  8:
		    	grade = 'B';
		    	break;
		    case  7:
		    	grade = 'C';
		    	break;
		    case  6:
		    	grade = 'D';
		    	break;
		    default:
		    	grade = 'F';
		    	break;
		}
		
		System.out.printf("grade=%c 학점 %n",grade);
		if(scanner != null) scanner.close();
		scanner = null;
		
		switch (grade) {
		case 'A':
			System.out.println("우수한 학점입니다.");
			break;
		case 'B':
		case 'C':
		case 'D':
			System.out.println("수고하셨습니다.");
			break;
		default:
			System.out.println("재수강 대상입니다.");
			break;
		}
		
		return ;
	}
}
