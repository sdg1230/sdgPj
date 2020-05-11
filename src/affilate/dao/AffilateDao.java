package affilate.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import affilate.vo.Affilate;
import common.JDBCTemplate;

public class AffilateDao {

	public ArrayList<Affilate> selectAffilate(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet res = null;
		ArrayList<Affilate> list = new ArrayList<Affilate>();
		String str = "select * from salon";
		try {
			pstmt=conn.prepareStatement(str);
			res = pstmt.executeQuery();
			while(res.next()) {
				Affilate a = new Affilate();
				a.setSalonAddr(res.getString("salon_addr"));
				a.setSalonFilename(res.getString("salon_filename"));
				a.setSalonFilepath(res.getString("salon_filepath"));
				a.setSalonInfo(res.getString("salon_info"));
				a.setSalonName(res.getString("salon_name"));
				a.setSalonNo(res.getInt("salon_no"));
				a.setSalonPhone(res.getString("salon_phone"));
				System.out.println(a.getSalonNo());
				list.add(a);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(res);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

}
