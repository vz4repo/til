package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.swing.JOptionPane;

public class Test02 {
	public static void main(String[] args) {
		System.out.println("JDBC TEST\n");
		// emp ���̺� ���� ��������
		
		// db_info.properties ����
		// �� �������� �����, ���⼭ �ڵ��� ���� �ƴ϶�
		// ȯ�漳�� ������ ���� ��������
		// runtime���� �ƴ϶� compile �� �����ؾ� �ϴ�
		// ������ �������� �����ؾ��� �������̱� ������
		String driver ="oracle.jdbc.OracleDriver"; 
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String user = "SCOTT";
		String pw = "TIGER";
		
		// ojdbc �ȿ� class ���� -> �� �߿� �ϳ��� �޸𸮿� �ø�
		//oracle.jdbc.OracleDriver
		// ó���ϰ� ���� sql ����
		//String sql = "select * from emp";
		String sql = "select * from emp where deptno = ?";
		// '?' ��  �ִ� sql ������ PreparedStatement�� ó���� ��
		Connection con = null; // Ư�� db ����
		PreparedStatement ps = null; // sql ���� ����
		ResultSet rs = null; // select ������ �����
		// select �� ������� ResultSet ����
		// update,delete,insert�� ������� ���� (�� �� row)
		
		// db ���� �ڵ�
		// ����ó���� �⺻
		try {
			// 1. DriverŬ������ �ε�
			Class.forName(driver);
			// compile Ÿ�ӿ� �����ǰ� ���� �ʱ� ����
			// �̷� ������� ��ü����
			// ���� ���̰� ������ �������� �ʵ���
			// ojdbc6.jar �� 
			// oracle.jdbc.OracleDriver Ŭ������ ����
			
			// 2. �ε��� DriverŬ������ �̿��ؼ�
			//    Connection��û(url, user, pwd)
			con = DriverManager.getConnection(url,user,pw);
			//System.out.println(con);
			
			// 3. ������Connection���κ��� Statement����
			// ó���ؾ� �� ���� �Ѱ��ֱ�
			ps = con.prepareStatement(sql);
			
			// ? �� ����
			//ps.setInt(1, 20); // ù ��° ����ǥ�� 20�� ��
			String deptno = JOptionPane.showInputDialog("deptno");
			ps.setInt(1,Integer.parseInt(deptno)); 
			
			// 4. ������ Statement�� �̿��ؼ� sql����
			rs = ps.executeQuery();
			
			// 5. ��� ó��
			int n = 0;
			while(rs.next()) {
				n++;
				System.out.printf("%10s",rs.getString("ename")+"|");
				System.out.print(rs.getInt("deptno")+"|");
				System.out.printf("%10s",rs.getString("job")+"|");
				System.out.printf("%5s",rs.getString("sal")+"|");
				System.out.println(rs.getDate("hiredate"));
				System.out.println("\n-----------------------------");
			}
			System.out.printf("�� %d�� �Դϴ�.\n",n);
		}catch(Exception e) {
			
			// 6. SQLException ó��
			System.out.println(e);
			
		}finally {
			// 7. �ڿ�����,�ݳ�(connection, statement, resultset)
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				System.out.println(e2);
			}
		}
		
		System.out.println("\nJDBC TEST END");
		
	}
}
