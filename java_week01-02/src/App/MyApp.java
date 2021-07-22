package App;

import java.util.Scanner;

public class MyApp {
	public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String cmd = null;
		while (true) {
			// 메뉴 구성
			System.out.println("원하는 메뉴 번호를 입력하세요 ..\n");
			System.out.println("1. 입     력  \n");
			System.out.println("2. 수     정  \n");
			System.out.println("3. 삭     제  \n");
			System.out.println("4. 검     색  \n");
			System.out.println("5. 목록보기  \n");
			System.out.println("9. 종     료  \n");
			
			cmd =  scanner.nextLine().trim();
			//int num =  scanner.nextInt();
			
			//System.out.println(cmd+" 입력");
			switch(cmd) {
			   case "1":
				   System.out.println("입력 작업 수행 ");
				   break;
			   case "2":
				   System.out.println("수정 작업 수행 ");
				   break;
			   case "3":
				   System.out.println("삭제 작업 수행 ");
				   break;
			   case "4":
				   System.out.println("검색 작업 수행 ");
				   break;
			   case "5":
				   System.out.println("목록보기 수행 ");
				   break;
			   case "9":
				   System.out.println("종료 수행 ");
				   System.out.println("종료를 원하면 q를 입력하세요. ");
				   if(scanner.nextLine().equalsIgnoreCase("q")) {
					   System.out.println("종료 합니다.");
					   scanner.close();
					   scanner = null;
					   return;
				   }else {
					   break;
				   }
				default:
				   System.out.println("메뉴선택을 다시 해 주세요 ");
			}
			
		}

	}
}
