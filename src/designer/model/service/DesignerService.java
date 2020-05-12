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
		return list;
	}

}
