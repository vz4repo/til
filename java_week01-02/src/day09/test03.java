package day09;

import javax.swing.JOptionPane;

public class test03 {

	public static void main(String[] args) {
			Controller cmd = new DeleteController();
			
			//클래스 내부 정의, 생성.
			//근데 이름이 없다. 익명클래스.
			Controller insert = new Controller(){
				//추상메소드 여기서 오버라이드
				@Override
				public void exec() {
					System.out.println("Insertt start");
				}	
			};
			//익명클래스 () {}; 까먹지말도록.  
			
			
			Controller update = new Controller() {				
				@Override
				public void exec() {					
					System.out.println("Update start");
				}
			};
			//Controller update = new
			//까지 입력하고 ctrl+space 누르면 자동완성.
			Controller delete = new Controller() {				
				@Override
				public void exec() {
					System.out.println("Delete start");					
				}
			};
			cmd.exec();
			insert.exec();
			delete.exec();
			update.exec();
			
			cmd = null;
			String msg = JOptionPane.showInputDialog("Enter Command. \n (1) Delete (2) Insert (3) Update");
			
			switch (msg) {
			case "1":
			case "Delete":
				cmd =  delete;
				break;
			case "2":
			case "Insert":
				cmd =  insert;
				break;
			case "3":
			case "Update":
				cmd =  update;
				break;
				//잘못누르면 default
			default:
				break;
			}
			
			if(cmd != null) {
				cmd.exec();
				//base() 추가
			}		
		}
	
}



interface Controller {
	void exec();
}

class DeleteController implements Controller{

	@Override
	public void exec() {
			System.out.println("DeleteController start");
	}
	
}