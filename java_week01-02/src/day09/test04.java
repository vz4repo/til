package day09;

import javax.swing.JOptionPane;

public class test04 {

	public static void main(String[] args) {
			Controller cmd = new DeleteController();	
			
			Controller insert =	()-> 	System.out.println("Insertt start");					
			Controller update = ()->	System.out.println("Update start");		
			Controller delete = ()-> 	System.out.println("Delete start");					

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
			default:
				break;
			}
			
			if(cmd != null) {
				cmd.exec();				
			}		
		}
}


