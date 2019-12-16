package day04;

public class Test04 {
	public static void main(String[] args) {
		int[] eng;         //배열 선언
		eng = new int[5];  //배열 생성
		
		eng[0] = 99;
		eng[1] = 88;
		eng[2] =100;
		eng[3] = 81;
		eng[4] = 67;
		
		double sum = 0;
		double avg = 0.0;
		for(int i=0;i<eng.length;i++) {
			System.out.print(eng[i]+" ");
			sum += eng[i];
		}
		System.out.println();
		avg = sum / eng.length;
		
		System.out.printf("합계 = %d %n",(int)sum);
		System.out.printf("평균 = %.2f %n",avg);

		String[] names = new String[5];
		names[0] = "홍길동";
		names[1] = "";
		names[2] = "박길동";
		names[3] = "고길동";
		names[4] = "최길동";

		for(int i=0;i<names.length;i++) {
		 	if(names[i] != null && names[i].length()>0) {
			    System.out.print(names[i].charAt(0)+"** ,");
			    System.out.print(eng[i]);
			    System.out.println();
		 	}
		}
		
	}
}





