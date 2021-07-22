package day08;

public class test02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
SingleTone s= SingleTone.getInstance();

/*
 * Debugging tip.
SingleTone s1= SingleTone.getInstance();
SingleTone s2= SingleTone.getInstance();
SingleTone s3= SingleTone.getInstance();

System.out.print(s1);
System.out.print(s2);
System.out.print(s3);
*/
	}

}

class SingleTone{
	private static SingleTone s;
	private SingleTone(){}
	
	public static SingleTone getInstance() {
		if (s==null) s = new SingleTone();
		return s;
	}
}