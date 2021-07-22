package day10;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;

import javax.swing.JOptionPane;

public class test07 {
	public static void main(String[] args) {
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("java01", "1230084");
		map.put("java02", "12394");
		map.put("java03", "12384");
		map.put("java04", "1234");
		map.put("java05", "12364");
		map.put("java06", "12354");
		map.put("java07", "12134");
		map.put("java01", "12324");
		//key값으로 value 뽑아내기
		//System.out.println(map.get("java06"));
		
		
		// Map loop
		Set<String> keys = map.keySet();
		Iterator<String> it = keys.iterator();
		while(it.hasNext()) {
			String id = (String) it.next();
			System.out.println(id+" = "+map.get(id));
		}
		
		//Login
		Scanner scanner = new Scanner(System.in);
		while(true) {
			System.out.println("Enter ID");
			String id = scanner.nextLine().trim();					
			if(!map.containsKey(id)) {
				System.out.println("sign up first");
				continue;
			}else {
				System.out.println("Enter PW");
				String pw = scanner.nextLine().trim();
				if(map.get(id).equals(pw)) {
					//map.get(id) 에서 받아온 value값과
					//pw에 저장된 value값 equals로 비교.
					System.out.println("login success");
					break;
				}else {
					System.out.println("login fail");
				}
			}
		}
		
		
		
		scanner.close();
		scanner = null;
		
		System.out.println("............end");
	}
}
