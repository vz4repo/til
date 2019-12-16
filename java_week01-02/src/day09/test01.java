package day09;

import javax.swing.JOptionPane;

public class test01 {
	public static void main(String[] args) { 
		
		//실행
		Command cmd = null;
		
		String msg = JOptionPane.showInputDialog("Enter Command. \n (1) Delete (2) Insert (3) Update");
		/*
		 * cmd, powershell에서 실행 방법.
		 * >cd 명령어로 bin 디렉토리 찾아가기
		 * >C:\Users\student\Documents\GitHub\MulCam\java_basic\bin
		 * >java day09.test01
		 */
		switch (msg) {
		case "1":
		case "Delete":
			cmd = new DeleteCommand();
			break;
		case "2":
		case "Insert":
			cmd = new InsertCommand();
			break;
		case "3":
		case "Update":
			cmd = new UpdateCommand();
			break;
			//잘못누르면 default
		default:
			cmd = new ListCommand();
			System.out.println("enter again");
			break;
		}
		
		if(cmd != null) {
			cmd.exec();
			//base() 추가
			cmd.base();			
		}		
	}
}

//실무에선 따르 파일 만든다.
//예시를 위해 한 곳에 다 만들었다.
interface Command{
	//구현부가 없는 메소드,
	//{} 브라켓 없는 메소드,
	//추상메소드.
	void exec();
	//void base(); 
	//그냥 기능 하나 추가하면 implements 애들 모두 에러.
	//추상클래스는 모두 오버라이딩 해야해서.
	default void base() {
		System.out.println("Command base() 기능");
	}
	//jdk 1.8부터 생긴 기능
	//default로 오버라이딩 오류 피해가기.

}

class DeleteCommand implements Command{
	@Override
	public void exec() {
		System.out.println("delete 수행");
	}
	//기능 구현은 여기서.
	//구현은 오버라이딩.
	//오버라이딩은 Eclipse가.
}
class UpdateCommand implements Command{
	@Override
	public void exec() {
		System.out.println("Update 수행");
	}

	@Override
	public void base() {
		Command.super.base();
		System.out.println("base() 수행");

	}
	
}

class InsertCommand implements Command{
	@Override
	public void exec() {
		System.out.println("Insert 수행");
	}
}

class ListCommand implements Command{
	//implements 안붙이면 
	//IDE 내부에서 인식을 못해서 자동생성 불가.	
	@Override
	public void exec() {
		System.out.println("List 수행");
	}
}