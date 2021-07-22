package day09;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
import java.util.StringTokenizer;

import day06.ex.Book;
//Ctrl+shift+O; 필요한거 한번에 import.
public class test07 {

	public static void main(String[] args) {
		/*
		System.out.println("start");
		try {
			Thread.sleep(7000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		System.out.println("----------------------");
		

		try {
			throw new Exception("Error message");
		} catch (Exception e) {
			//e.printStackTrace();
			System.out.println(e.getMessage());
		}
		System.out.println("end");
		*/

		
		System.out.println("----------START---------");
		//import java.util.Scanner;
		
		try(Scanner scanner = new Scanner(new File("bookdata.txt"));) {
			//StringTokenizer st = null;
			//split과 거의 비슷한 기능

			while(scanner.hasNextLine()) {
				//st = new StringTokenizer(scanner.nextLine());
				//split과 거의 비슷한 기능
				
				String [] data = scanner.nextLine().split(" ");
				//string split과 tokenizer 검색필요.
				Book book = new Book (data[0], Integer.parseInt(data[1]));
				System.out.println(book);
			}
		} catch (FileNotFoundException e) {
			System.out.println("bookdata.txt file(s) not exist");
		} 
		
		System.out.println("----------E N D--------");
		
	}

}
