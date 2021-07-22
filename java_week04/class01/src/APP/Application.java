package APP;

import DAO.DeptDAO;

public class Application {

	public static void main(String[] args) {
		System.out.println("START");
		DeptDAO dao = new DeptDAO();
//		dao.insertDept("Zip E", "GalGeYo");
		
		dao.deleteDept(50);
		
		
		
		System.out.println("END");
	}
}
