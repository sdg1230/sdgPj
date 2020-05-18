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

	public int updateDesigner(Designer d) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new DesignerDao().updateDesigner(conn, d);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<Designer> moreDesigner(int start) {
		Connection conn = JDBCTemplate.getConnection();
		int length=4; 
		int end = start+length-1;
		ArrayList<Designer> list = new DesignerDao().moreDesigner(conn,start,end);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<Designer> searchDesigner(String keyword, String salonName) {
		Connection conn = JDBCTemplate.getConnection();
		if(salonName.length()==0) {
			if(keyword.equals("")) {
				ArrayList<Designer> list = new DesignerDao().selectAllDesigner(conn);
				return list;
			}else {
				ArrayList<Designer> list = new DesignerDao().searchDesignerName(conn, keyword);
				return list;				
			}
			
		}else {
			if(keyword.equals("")) {
				ArrayList<Designer> list= new DesignerDao().selectBySalon(conn, salonName);
				return list;
			}else {
				ArrayList<Designer> list = new DesignerDao().searchDesignerTwoName(conn, keyword, salonName);
				return list;				
			}
		}
		
	}

	

}
