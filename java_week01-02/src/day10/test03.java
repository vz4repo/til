package day10;

import java.util.Stack;
//java.util에 있는 stack 기능
public class test03 {
	public static void main(String[] args) {
		//string 배열 관리하는 스택
		Stack<String> s1 = new Stack<String>();
		s1.push("asdfqwerzxcv");
		System.out.println(s1.peek());
		System.out.println(s1.pop());
		System.out.println(s1.isEmpty());
		
		//int 배열 관리하는 스택
		Stack<Integer> s2  = new Stack<Integer>();
		s2.push(99);
		System.out.println(s2.peek());
		System.out.println(s2.isEmpty());
	}
}
