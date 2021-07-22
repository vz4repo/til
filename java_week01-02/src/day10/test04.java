package day10;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;

import javax.swing.JOptionPane;
//주소 주의

public class test04 {

	public static void main(String[] args) {
		//List list1 = new ArrayList();
		//이렇겡 안쓴다.
		//List<String> list = new ArrayList<String>();
		List<String> list = new Vector<String>();
		//ArrayList, Vector 사용할걸 import 먼저 해야한다.
System.out.println(list.size());
//>0
list.add("Gong");
list.add("Kong");
list.add("Tong");
list.add("Hong");
list.add("Long");
list.add("Long");
list.add("Long");
list.add("Long");
//중복데이터 삽입 가능.
list.add("Qong");
list.add("Song");
list.add("Xong");
//리사이징 알아서 한다. 사이즈 걱정 x
System.out.println(list.size());
//>8
for(int i=0; i<list.size(); i++) {
	System.out.println(list.get(i));
}
System.out.println("is Tong still there ?" +list.contains("Tong"));

System.out.println("\n\n----------------------\n\n");


//iterator의 기초.
System.out.println("------Iterator Searching------");
Iterator<String> it = list.iterator();
while(it.hasNext()) {
	String data = it.next();
	System.out.println(data.charAt(0)+"***");
	System.out.println(data);
}
System.out.println("------Iterator Removing------");
String rname = JOptionPane.showInputDialog("choose a name to remove");
it = list.iterator();
while(it.hasNext()) {
	String data = (String) it.next();
	if(rname.equals(data)){
		it.remove();
	}
}
System.out.println(list);

list.add(2,"Someone 2nd");
//2번째 인덱스에 추가. 추가 작업 필요없이.
System.out.println(list);
	}

}
