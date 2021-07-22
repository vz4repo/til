package test_01;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import VO.DeptVO;
import util.jdbcUtil;

public class test03 {

	public static void main(String[] args) {
		for(DeptVO data:deptList()) {
			System.out.printf("%d | %-12s | %s\n",
					data.getDeptno(), 
					data.getDname(), 
					data.getLoc()
					);
		}
	}

	//JDBC template
	public static List<DeptVO> deptList() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null; //select 리턴 값
//		int row = 0; // DML 리턴 값
		String sql = "select * from dept";
		
		List<DeptVO> list = new ArrayList<DeptVO>();
		try {
			con = jdbcUtil.getConnection();
			ps = con.prepareStatement(sql);
			/*
			 * "?"의 값 세팅 노가다
			 * */
			
			rs = ps.executeQuery(); //select 구문 처리 함수
//			row = ps.executeUpdate(); //dml 구문 처리 함수
			
			//결과 값 처리
			//select는 while처리
			while(rs.next()) {
				DeptVO vo = new DeptVO(
						rs.getInt("deptno"),
						rs.getString("dname"),
						rs.getString("loc")
						);
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcUtil.close(con, ps, rs);
		}
		return list;
	}
}
