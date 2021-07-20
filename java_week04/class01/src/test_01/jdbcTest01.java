package test_01;
import java.sql.*;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.Statement;

public class jdbcTest01 {

	/**
	 * @param args
	 */
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		System.out.println("JDBC TEST START");
		
		//밑에 있는 코딩들은 밖으로 나갈 자원. 하드코딩 x. 
		//컴파일때 x. 런타임때 ㅇ.
		String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String user="scott";
		String pw="tiger";
		String driver="oracle.jdbc.OracleDriver";
		//순서는 중요 x
					
		String sql = "select * from dept";
		//반드시 돌아가는 것만 넣는다.
		
		//java.sql에 있다.
		//sql 구문을 관리할 관리객체.
		Connection con = null;
		PreparedStatement ps = null;
		//결과값을 뽑아주는 객체
		ResultSet rs = null;
		
		try {
			//1. Driver 클래스 로딩			
			Class.forName(driver);
			
			//2. Connection 요청
			con = DriverManager.getConnection(url, user, pw);
			
			//오타 확인용 sys.out
//			System.out.println(con);
			
			//3. 생성된 connection으로 statement 생성
			ps = con.prepareStatement(sql);
			
			//4. statement로 sql수행
			rs = ps.executeQuery();
			
			//5.rs로 들어간 결과값 처리 (ResultSet, int)
			// ResultSet타입의 변수 rs는 결과 테이블을 reference한다.
			//.next 다음값이 있으면 True가 리턴되어 계속 도는 while
			while(rs.next()) {
				System.out.print(rs.getString("deptno")+" ");
				System.out.print(rs.getString("dname")+" ");
				System.out.print(rs.getString("loc")+" ");
				System.out.println("\n");
			}
			//vo, record 객체....???
			//n tier base programming; with socket programming;			
		} catch (Exception e) {
			//6. exception 처리; e뿌리기
			System.out.println(e);
		}finally {
			//7. 자원반납 (connection, statement, resultset
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				//6. exception 처리; e뿌리기
				System.out.println(e2);
			}
		}
				
		System.out.println("JDBC TEST END");
	}

}
