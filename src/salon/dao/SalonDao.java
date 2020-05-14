package salon.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import salon.vo.Salon;

public class SalonDao {

	public ArrayList<Salon> selectSalon(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Salon> slist = new ArrayList<Salon>();
		String query = "select salon_no,salon_name from salon";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Salon s = new Salon();
				s.setSalonNo(rset.getInt("salon_no"));
				s.setSalonName(rset.getString("salon_name"));
				slist.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return slist;
	}

}
