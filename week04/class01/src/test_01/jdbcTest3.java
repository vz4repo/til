package test_01;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.jdbcUtil;

public class jdbcTest3 {
	//반복적으로 쓰는 JDBC 코드들 미리 만들기
	public static void main(String[] args) {
	
	}
	//JDBC template
	public void temp() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null; //select 리턴 값
		int row = 0; // DML 리턴 값
		String sql = "";
		
		try {
			con = jdbcUtil.getConnection();
			ps = con.prepareStatement(sql);
			/*
			 * "?"의 값 세팅 노가다
			 * */
			
			rs = ps.executeQuery(); //select 구문 처리 함수
			row = ps.executeUpdate(); //dml 구문 처리 함수
			
			//결과 값 처리
			//select while처리
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcUtil.close(con, ps, rs);
		}
	}
}
