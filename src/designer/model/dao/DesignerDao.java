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
		String query = "select * from designer order by designer_name";
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

	public int insertDesigner(Connection conn, Designer d) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query="insert into designer values(seq_designer_no.nextval,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, d.getSalonName());
			pstmt.setString(2, d.getDesignerName());
			pstmt.setString(3, d.getDesignerInfo());
			pstmt.setString(4, d.getDesignerFilename());
			pstmt.setString(5, d.getDesignerFilepath());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int deleteDesigner(Connection conn, int designerNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query="delete from designer where designer_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, designerNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Designer selectByNo(Connection conn, int designerNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Designer d = null;
		String query = "select * from designer where designer_no=?";
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, designerNo);
			rset=pstmt.executeQuery();
			if(rset.next()) {
				d=new Designer();
				d.setDesignerNo(rset.getInt("designer_no"));
				d.setDesignerName(rset.getString("designer_name"));
				d.setSalonName(rset.getString("salon_name"));
				d.setDesignerInfo(rset.getString("designer_info"));
				d.setDesignerFilename(rset.getString("designer_filename"));
				d.setDesignerFilepath(rset.getString("designer_filepath"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return d;
	}

	public int updateDesigner(Connection conn, Designer d) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query="update designer set salon_name=?, designer_name=?, designer_info=?, designer_filename=?, designer_filepath=? where designer_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, d.getSalonName());
			pstmt.setString(2, d.getDesignerName());
			pstmt.setString(3, d.getDesignerInfo());
			pstmt.setString(4, d.getDesignerFilename());
			pstmt.setString(5, d.getDesignerFilepath());
			pstmt.setInt(6, d.getDesignerNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<Designer> moreDesigner(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Designer> list = new ArrayList<Designer>();
		String query = "select * from (select ROWNUM as rnum, d.* from (select * from designer order by designer_name)d) where rnum between ? and ?";
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
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
