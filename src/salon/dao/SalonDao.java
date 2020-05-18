package salon.dao;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import designer.model.vo.Designer;
import salon.vo.Salon;
import salonReview.vo.SalonReview;


public class SalonDao {

	public ArrayList<Salon> selectAffilate(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet res = null;
		ArrayList<Salon> list = new ArrayList<Salon>();
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
				Salon a = new Salon();
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

	public ArrayList<Salon> selectSolonRevuew(Connection conn, String sq) {
		PreparedStatement pstmt = null;
		ResultSet res = null;
		ArrayList<Salon> list = new ArrayList<Salon>();
		String str = "select * from salon where salon_name like ?";
		try {
			pstmt=conn.prepareStatement(str);
			pstmt.setString(1, "%"+sq+"%");
			res = pstmt.executeQuery();
			while(res.next()) {
				Salon a = new Salon();
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

	public ArrayList<Salon> selectAffilates(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet res = null;
		ArrayList<Salon> list = new ArrayList<Salon>();
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
				Salon a = new Salon();
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
	public Salon salonSelect(Connection conn, String salonName) {
		PreparedStatement pstmt = null;
		ResultSet res = null;
		Salon a = null;
		String str = "select * from salon where salon_name=?";
		try {
			pstmt = conn.prepareStatement(str);
			pstmt.setString(1, salonName);
			res=pstmt.executeQuery();
			while (res.next()) {
				a= new Salon();
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

	public int salonUpdate(Connection conn, Salon aff) {
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

	public int insertAffilatr(Connection conn, Salon aff) {
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

	public ArrayList<Salon> selectSalon(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet res = null;
		ArrayList<Salon> list = new ArrayList<Salon>();
		String str = "select * from salon";
		try {
			pstmt = conn.prepareStatement(str);
			res = pstmt.executeQuery();
			while (res.next()) {
				Salon s = new Salon();
				s.setSalonAddr(res.getString("salon_addr"));
				s.setSalonFilename(res.getString("salon_filename"));
				s.setSalonFilepath(res.getString("salon_filepath"));
				s.setSalonInfo(res.getString("salon_info"));
				s.setSalonName(res.getString("salon_name"));
				s.setSalonNo(res.getInt("salon_no"));
				s.setSalonPhone(res.getString("salon_phone"));
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

	public ArrayList<SalonReview> salonSelect(Connection conn, int start, int end, String salonName) {
		PreparedStatement pstmt = null;
		ResultSet res = null;
		ArrayList<SalonReview> sr = new ArrayList<SalonReview>();
		SalonReview s = null;
		String str ="select * from " + 
				"(select rownum as rnum,n.* from " + 
				"(select * from salon_review where salon_name=? order by reserve_no desc)n) " + 
				"where rnum BETWEEN ? and ?";
		try {
			pstmt = conn.prepareStatement(str);
			pstmt.setString(1, salonName);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			res = pstmt.executeQuery();
			while (res.next()) {
				s = new SalonReview();
				s.setReserveNo(res.getInt("reserve_no"));
				System.out.println(s.getReserveNo());
				s.setReviewComment(res.getString("review_comment"));
				s.setReviewDate(res.getDate("review_date"));
				s.setReviewStar(res.getInt("review_star"));
				s.setReviewWriter(res.getString("review_writer"));
				s.setSalonName(res.getString("salon_name"));
				System.out.println(s.getReviewComment());
				System.out.println(s.getReviewStar());
				System.out.println("dd");
				sr.add(s);
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(res);
			JDBCTemplate.close(pstmt);
		}
		return sr;
	}

	public ArrayList<Designer> salondesigner(Connection conn, String salonName) {
		PreparedStatement pstmt = null;
		ResultSet res = null;
		ArrayList<Designer> ds = new ArrayList<Designer>();
		Designer d = null;
		String str = "select * from designer where salon_name=?";
		System.out.println(salonName);
		try {
			pstmt = conn.prepareStatement(str);
			pstmt.setString(1, salonName);
			res = pstmt.executeQuery();
			while (res.next()) {
				d = new Designer();
				d.setDesignerFilename(res.getString("designer_filename"));
				d.setDesignerFilepath(res.getString("designer_filepath"));
				d.setDesignerInfo(res.getString("designer_info"));
				d.setDesignerName(res.getString("designer_name"));
				d.setDesignerNo(res.getInt("designer_no"));
				d.setSalonName(res.getString("salon_name"));
				
				ds.add(d);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(res);
			JDBCTemplate.close(pstmt);
		}
		return ds;
	}


	public ArrayList<Salon> selectBestSalon(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Salon> list = new ArrayList<Salon>();
		String query = "select * from (select salon_name,avg(review_star) as review_star,row_number() over(order by avg(review_star)desc) as rank from salon_review group by salon_name) join salon using(salon_name)  where rank between 1 and 3  order by rank";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Salon s = new Salon();
				s.setSalonFilepath(rset.getString("salon_filepath"));
				s.setSalonName(rset.getString("salon_name"));
				s.setSalonNo(rset.getInt("salon_no"));
				s.setReviewStarAvg(rset.getDouble("review_star"));
				list.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	
	
}
