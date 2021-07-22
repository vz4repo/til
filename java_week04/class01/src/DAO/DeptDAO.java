package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.jdbcUtil;

public class DeptDAO {
	//CRUD 작업 담당
	public void insertDept(String dname, String loc) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null; //select 리턴 값
		int row = 0; // DML 리턴 값
		String sql = "insert into dept (deptno, dname, loc) "+ 
		"values ((select nvl(max(deptno),0)+1 from dept2),?,?)";
		
		try {
			con = jdbcUtil.getConnection();
			ps = con.prepareStatement(sql);

			ps.setString(1, dname);
			ps.setString(2, loc);
			
//			rs = ps.executeQuery(); //select 구문 처리 함수
			row = ps.executeUpdate(); //dml 구문 처리 함수
			
			//결과 값 처리
			//select while처리
			//int 값은 딱히
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcUtil.close(con, ps, rs);
		}
	}
	
	public void deleteDept(int deptno) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null; //select 리턴 값
		int row = 0; // DML 리턴 값
		String sql = "delete from dept where deptno=?";
		
		try {
			con = jdbcUtil.getConnection();
			ps = con.prepareStatement(sql);

			ps.setInt(1, deptno);
			
//			rs = ps.executeQuery(); //select 구문 처리 함수
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
