package util;

import java.sql.*;

public class jdbcUtil {
	//static heap자원 못쓴다.
	public static Connection getConnection()
	{
		String url="jdbc:oracle:thin:@70.12.60.90:1521:XE";
		String user="scott";
		String pw="TIGER";
		String driver="oracle.jdbc.OracleDriver";
		
		Connection con = null;
				
		try {
			//1. Driver 클래스 로딩			
			Class.forName(driver);
			
			//2. Connection 요청
			con = DriverManager.getConnection(url, user, pw);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}
	//자원반납용
	public static void close(Connection con, Statement ps, ResultSet rs) {
		try {
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(con != null) con.close();
		} catch (Exception e2) {
			//6. exception 처리; e뿌리기
			System.out.println(e2);
		}
	}
}
