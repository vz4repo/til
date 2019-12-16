package day05;

public class Prob5 {
	public static void main(String[] args) {
		Prob5 p5 = new Prob5();
		
		System.out.println(Prob5.leftPad("SDS", 6, '#'));
		System.out.println(Prob5.leftPad("SDS", 5, '$'));
		System.out.println(Prob5.leftPad("SDS", 2, '&'));
	
		System.out.println(p5.rightPad("SDS", 6, '#'));

	}
	//static method 클래스메소드
	public static String leftPad(String str, int size, char padChar) {
		StringBuilder sb = new StringBuilder();
		
		int count = size-str.length();
		for(int i = 0; i<count ;i++) {
			//str = padChar + str;
			sb.append(padChar);
		}
		sb.append(str);
		
	    return sb.toString();	
	}
	
	//instance method : new 를 이용instance 화 한후 주소를 이용 하여 접근  
	public String rightPad(String str, int size, char padChar) {
		StringBuilder sb = new StringBuilder();
		sb.append(str);
		for(int i = 0; i< size-str.length();i++) {
			sb.append(padChar);
		}
	    return sb.toString();	
	}
}
