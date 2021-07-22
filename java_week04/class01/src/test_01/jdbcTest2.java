package test_01;
import java.sql.*;

import javax.swing.JOptionPane;

import util.jdbcUtil;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.Statement;

public class jdbcTest2 {

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
					
		String sql = "select * from emp where deptno = ?";
		//반드시 돌아가는 것만 넣는다.
		//"?"를 통한 변수 바인딩도 생각해야 한다.
		
		//java.sql에 있다.
		//sql 구문을 관리할 관리객체.
		Connection con = null;
		PreparedStatement ps = null;
		//결과값을 뽑아주는 객체. "?" 처리를 한다.
		ResultSet rs = null;
		
		try {
			
			//2. Connection 요청
			//jdbcUtil이 대신 만들어준다.
			con = jdbcUtil.getConnection();
			
			//오타 확인용 sys.out
//			System.out.println(con);
			
			//3. 생성된 connection으로 statement 생성
			ps = con.prepareStatement(sql);
			
			String deptno_val = JOptionPane.showInputDialog("Enter deptno: ");
			// "?" 세팅; "?"가 여러개일수 있다.
			ps.setInt(1, Integer.parseInt(deptno_val));
			
			//4. statement로 sql수행
			rs = ps.executeQuery();
			
			//5.rs로 들어간 결과값 처리 (ResultSet, int)
			//.next 다음값이 있으면 계속 도는 while
			while(rs.next()) {
				System.out.print(rs.getString("empno")+" ");
				System.out.print(rs.getString("ename")+" ");
				System.out.print(rs.getString("job")+" ");
				System.out.print(rs.getString("mgr")+" ");
				System.out.print(rs.getDate("hiredate")+" ");
				System.out.print(rs.getString("sal")+" ");
				System.out.print(rs.getString("comm")+" ");
				System.out.print(rs.getInt("deptno")+" ");
				System.out.println("\n");
			}
		} catch (Exception e) {
			//6. exception 처리; e뿌리기
			System.out.println(e);
		}finally {
			jdbcUtil.close(con, ps, rs);
		}
				
		System.out.println("JDBC TEST END");
	}

}
