package affilate.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import affilate.vo.Affilate;
import affilate.vo.AffilateStar;
import common.JDBCTemplate;


public class AffilateDao {

	public ArrayList<Affilate> selectAffilate(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet res = null;
		ArrayList<Affilate> list = new ArrayList<Affilate>();
		String str = "select * from " + 
				"(select rownum as rnum,n.* from " + 
				"(select * from salon order by salon_no desc)n) " + 
				"where rnum BETWEEN ? and ?";
		try {
			pstmt=conn.prepareStatement(str);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
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

	public int totalCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet res = null;
		int result = 0;
		String str = "select count(*) as cnt from salon";
		try {
			pstmt = conn.prepareStatement(str);
			res = pstmt.executeQuery();
			if(res.next()) {
				result = res.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(res);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public  ArrayList<AffilateStar> selectSolonRevuew(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet res = null;
		ArrayList<AffilateStar> list = new ArrayList<AffilateStar>();
		String str = "select salon_name,avg(review_star) from salon_review group by salon_name";
		try {
			pstmt = conn.prepareStatement(str);
			res = pstmt.executeQuery();
			while (res.next()) {
				AffilateStar s = new AffilateStar();
				s.setReviewStar(res.getDouble("avg(review_star)"));
				System.out.println(s.getReviewStar());
				list.add(s);
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

	public ArrayList<AffilateStar> selectAffilate(Connection conn, String sq) {
		PreparedStatement pstmt = null;
		ResultSet res = null;
		ArrayList<AffilateStar> list = new ArrayList<AffilateStar>();
		String str = "select salon_name,avg(review_star) from salon_review where salon_name like ? group by salon_name";
		try {
			pstmt = conn.prepareStatement(str);
			pstmt.setString(1, "%"+sq+"%");
			res = pstmt.executeQuery();
			while (res.next()) {
				AffilateStar s = new AffilateStar();
				s.setReviewStar(res.getDouble("avg(review_star)"));
				System.out.println(s.getReviewStar());
				list.add(s);
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

	public ArrayList<Affilate> selectSolonRevuew(Connection conn, String sq) {
		PreparedStatement pstmt = null;
		ResultSet res = null;
		ArrayList<Affilate> list = new ArrayList<Affilate>();
		String str = "select * from salon where salon_name like ?";
		try {
			pstmt=conn.prepareStatement(str);
			pstmt.setString(1, "%"+sq+"%");
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
