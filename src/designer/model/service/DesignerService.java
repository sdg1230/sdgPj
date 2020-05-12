package designer.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import designer.model.dao.DesignerDao;
import designer.model.vo.Designer;
import designer.model.vo.DesignerListData;

public class DesignerService {

	public DesignerListData selectAllDesigner() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Designer> designerList = new DesignerDao().selectAllDesigner(conn);
		ArrayList<String> salonList = new DesignerDao().selectAllDesignerSalon(conn);
		DesignerListData dld = new DesignerListData(designerList, salonList);
		JDBCTemplate.close(conn);
		return dld;
	}

	public ArrayList<Designer> selectBySalon(String salonName) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Designer> list = new DesignerDao().selectBySalon(conn, salonName);
		JDBCTemplate.close(conn);

		return list;
	}

	public int insertDesigner(Designer d) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new DesignerDao().insertDesigner(conn, d);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int deleteDesigner(int designerNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new DesignerDao().deleteDesigner(conn, designerNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public Designer selectByNo(int designerNo) {
		Connection conn = JDBCTemplate.getConnection();
		Designer d = new DesignerDao().selectByNo(conn, designerNo);
		JDBCTemplate.close(conn);
		return d;
	}

	

}
