package day10;

import java.util.HashSet;
import java.util.TreeSet;

import util.MyUtil;

import java.util.Iterator;
import java.util.Set;

public class test05 {

	public static void main(String[] args) {
		//Hash Set 구조
		//Set<String> set = new HashSet<String>();
		Set<String> set = new TreeSet<String>();
		set.add("Park");
		set.add("Yark");
		set.add("Tark");
		set.add("Rark");
		set.add("Qark");
		set.add("Zark");
		set.add("Zark");
		set.add("Zark");
		set.add("Zark");
		//중복 값은 어떻게 되나?
		set.add("Xark");
		set.add("Cark");
		
		//iterator의 기초.
		Iterator<String> it = set.iterator();
		while(it.hasNext()) {
			String data = it.next();
			System.out.println(data);
			//옆으로 나오게 출력하려면??
			
			MyUtil.interatorPrint(set);
		}
	}
}
