package affilate.dao;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import affilate.vo.Affilate;

import common.JDBCTemplate;
import salonReview.vo.SalonReview;


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

	public  ArrayList<SalonReview> selectSolonRevuew(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet res = null;
		ArrayList<SalonReview> list = new ArrayList<SalonReview>();
		String str = "select salon_name,avg(review_star) from salon_review group by salon_name";
		try {
			pstmt = conn.prepareStatement(str);
			res = pstmt.executeQuery();
			while (res.next()) {
				SalonReview s = new SalonReview();
				s.setReviewStars(res.getDouble("avg(review_star)"));
				s.setSalonName(res.getString("salon_name"));
				System.out.println(s.getSalonName());
				System.out.println(s.getReviewStars());
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

	public ArrayList<SalonReview> selectAffilate(Connection conn, String sq) {
		PreparedStatement pstmt = null;
		ResultSet res = null;
		ArrayList<SalonReview> list = new ArrayList<SalonReview>();
		String str = "select salon_name,avg(review_star) from salon_review where salon_name like ? group by salon_name";
		try {
			pstmt = conn.prepareStatement(str);
			pstmt.setString(1, "%"+sq+"%");
			res = pstmt.executeQuery();
			while (res.next()) {
				SalonReview s = new SalonReview();
				s.setReviewStars(res.getDouble("avg(review_star)"));
				s.setSalonName(res.getString("salon_name"));
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

	public ArrayList<Affilate> selectAffilates(Connection conn, int start, int end) {
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

	public int salonDelete(Connection conn,String salonName) {
		PreparedStatement pstmt = null;
		int result = 0;
		String str="delete salon where salon_name=?";
		try {
			pstmt = conn.prepareStatement(str);
			pstmt.setString(1, salonName);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	@SuppressWarnings("null")
	public Affilate salonSelect(Connection conn, String salonName) {
		PreparedStatement pstmt = null;
		ResultSet res = null;
		Affilate a = null;
		String str = "select * from salon where salon_name=?";
		try {
			pstmt = conn.prepareStatement(str);
			pstmt.setString(1, salonName);
			res=pstmt.executeQuery();
			while (res.next()) {
				a= new Affilate();
				a.setSalonAddr(res.getString("salon_addr"));
				a.setSalonFilename(res.getString("salon_filename"));
				a.setSalonFilepath(res.getString("salon_filepath"));
				a.setSalonInfo(res.getString("salon_info"));
				a.setSalonName(res.getString("salon_name"));
				a.setSalonNo(res.getInt("salon_no"));
				a.setSalonPhone(res.getString("salon_phone"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(res);
			JDBCTemplate.close(pstmt);
		}
		return a;
	}

	public int salonUpdate(Connection conn, Affilate aff) {
		PreparedStatement pstmt=null;
		int result = 0;
		String str = "update salon set SALON_ADDR=?,SALON_FILENAME=?,SALON_FILEPATH=?,SALON_INFO=?,SALON_NAME=?,SALON_PHONE=? where SALON_NO=?";
		try {
			pstmt = conn.prepareStatement(str);
			pstmt.setString(1, aff.getSalonAddr());
			pstmt.setString(2, aff.getSalonFilename());
			pstmt.setString(3, aff.getSalonFilepath());
			pstmt.setString(4, aff.getSalonInfo());
			pstmt.setString(5, aff.getSalonName());
			pstmt.setString(6, aff.getSalonPhone());
			pstmt.setInt(7, aff.getSalonNo());
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int insertAffilatr(Connection conn, Affilate aff) {
		PreparedStatement pstmt = null;
		int result = 0;
		String str ="insert into salon values(SEQ_SALON_NO.NEXTVAL,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(str);
			pstmt.setString(1, aff.getSalonName());
			pstmt.setString(2, aff.getSalonPhone());
			pstmt.setString(3, aff.getSalonAddr());
			pstmt.setString(4, aff.getSalonInfo());
			pstmt.setString(5, aff.getSalonFilename());
			pstmt.setString(6, aff.getSalonFilepath());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	
	
}
