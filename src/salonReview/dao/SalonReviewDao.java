package salonReview.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import salonReview.vo.SalonReview;

public class SalonReviewDao {

	public int insertReview(Connection conn, SalonReview s) {
		PreparedStatement pstmt = null;
		int result = 0;		
		String query = "insert into salon_review values(?,?,?,?,?,sysdate)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, s.getReserveNo());
			pstmt.setString(2, s.getSalonName());
			pstmt.setString(3, s.getReviewWriter());
			pstmt.setInt(4, s.getReviewStar());
			pstmt.setString(5, s.getReviewComment());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
	}

	

	public int updateReserveReview(Connection conn, String reserveReview, SalonReview s) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update reserve set reserve_review=? where reserve_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, reserveReview);
			pstmt.setInt(2, s.getReserveNo());
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
