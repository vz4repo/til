package day10;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;
import java.util.Set;

import javax.swing.JOptionPane;

public class test06 {
	public static void main(String[] args) {
		Set<Book> bookList = new HashSet<Book>();
		
		//Add
		if(bookList.add(new Book("java",500))) {
			System.out.println("Add Success");
		}else {
			System.out.println("already has");
		}
		bookList.add(new Book("java",500));
		bookList.add(new Book("sql",7500));
		bookList.add(new Book("ajax",6500));
		bookList.add(new Book("java",500));
		if(bookList.add(new Book("java",500))) {
			System.out.println("Add Success");
		}else {
			System.out.println("already has");
		}
		bookList.add(new Book("java",500));
		//내부적으로 equals가 돌아야 중복처리가 된다.
		bookList.add(new Book("vue",5300));
		bookList.add(new Book("C#",2500));
		bookList.add(new Book("JS",500));
		
		//print
		Iterator<Book> it = bookList.iterator();
		while(it.hasNext()) {
			Book book = (Book) it.next();
			System.out.println(book);
		}
		
		//Search
		String key = JOptionPane.showInputDialog("Enter the title");
		System.out.println("Searching the list for "+key);
		it = bookList.iterator();
		while (it.hasNext()) {
			Book book = (Book) it.next();
			
			if(book.title.toUpperCase().contains(key.toUpperCase()))
				System.out.println(book);
		}
		
		//delete
		Scanner scanner = new Scanner(System.in);
		System.out.println("Enter the title(DEL)");
		//trim으로 공백 제거
		//삭제는 정확한 이름으로 신중하게.	
		String msg = scanner.nextLine().trim();
		it = bookList.iterator();
		while (it.hasNext()) {
			Book book = (Book) it.next();
			
			if(book.title.contains(msg)) {
				System.out.println(book);
				System.out.println("Press Y to remove (Y/N)");
				String msgDel = scanner.nextLine().trim();
				if(msgDel.equalsIgnoreCase("y")) {
			//if(msg.equals("Y".toUpperCase())) {
				it.remove();
			}
			}
			
		}
		
		//print
		it = bookList.iterator();
		while(it.hasNext()) {
			Book book = (Book) it.next();
			System.out.println(book);
		}
		//Edit
		System.out.println("Enter the title(EDIT)");
		msg = scanner.nextLine().trim();
		it = bookList.iterator();
		while(it.hasNext()) {
			Book book = (Book) it.next();
			
			if(book.title.contains(msg)) {
				book.title = book.title+"#####";
			}
		}
		//print
		it = bookList.iterator();
		while(it.hasNext()) {
			Book book = (Book) it.next();
			System.out.println(book);
		}
				//Scanner 유틸의 기본 2줄.
				scanner.close();
				scanner = null;
	
	}
}


class Book{
	String title;
	int price;
	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + price;
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Book other = (Book) obj;
		if (price != other.price)
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		return true;
	}
	public Book(String title, int price) {
		super();
		this.title = title;
		this.price = price;
	}
	@Override
	public String toString() {
		return "Book [title=" + title + ", price=" + price + "]";
	}
	
}