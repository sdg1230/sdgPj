package designer.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import designer.model.vo.Designer;

public class DesignerDao {

	public ArrayList<Designer> selectAllDesigner(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Designer> list = new ArrayList<Designer>();
		String query = "select * from designer";
		try {
			pstmt=conn.prepareStatement(query);
			rset=pstmt.executeQuery();
			while(rset.next()) {
				Designer d=new Designer();
				d.setDesignerNo(rset.getInt("designer_no"));
				d.setDesignerName(rset.getString("designer_name"));
				d.setSalonName(rset.getString("salon_name"));
				d.setDesignerInfo(rset.getString("designer_info"));
				d.setDesignerFilename(rset.getString("designer_filename"));
				d.setDesignerFilepath(rset.getString("designer_filepath"));
				list.add(d);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public ArrayList<String> selectAllDesignerSalon(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<String> list = new ArrayList<String>();
		String query = "select salon_name  from designer group by salon_name";
		try {
			pstmt=conn.prepareStatement(query);
			rset=pstmt.executeQuery();
			while(rset.next()) {
				list.add(rset.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public ArrayList<Designer> selectBySalon(Connection conn, String salonName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Designer> list = new ArrayList<Designer>();
		String query = "select * from designer where salon_name=?";
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, salonName);
			rset=pstmt.executeQuery();
			while(rset.next()) {
				Designer d=new Designer();
				d.setDesignerNo(rset.getInt("designer_no"));
				d.setDesignerName(rset.getString("designer_name"));
				d.setSalonName(rset.getString("salon_name"));
				d.setDesignerInfo(rset.getString("designer_info"));
				d.setDesignerFilename(rset.getString("designer_filename"));
				d.setDesignerFilepath(rset.getString("designer_filepath"));
				list.add(d);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

}
