package day04;

public class Prob3 {
	public static void main(String[] args) {
		
		
//		String[] strData;
//		strData = new String[4];
//		strData[0] = "Java Programming";
//		strData[1] = "JDBC";
//  	    strData[2] = "Oracle10g";
//  	    strData[3] = "JSP/Servlet";
		
		
		String[] strData  = { 
					          "Java Programming" , 
					          "JDBC", 
					          "Oracle10g", 
					          "JSP/Servlet" 
					         };
	
		for(int i= strData.length-1;i>=0;i--) {
			//System.out.println(strData[i].);
			for(int j=strData[i].length()-1;j>=0;j--) {
				System.out.print(strData[i].charAt(j));
			}
			System.out.println();
		}
		
		
		
	}
}
