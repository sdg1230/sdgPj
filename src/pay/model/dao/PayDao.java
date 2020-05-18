package pay.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import common.JDBCTemplate;
import pay.model.vo.Pay;

public class PayDao {

	public int insertPayment(Connection conn, Pay p) {
		PreparedStatement pstmt= null;
		int result = 0;
		String query = "insert into payment values(?,?,?,default,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, p.getReserveNo());
			pstmt.setString(2, p.getMemberId());
			pstmt.setInt(3, p.getPaymentPrice());
			pstmt.setString(4, p.getPaymentId());
			pstmt.setString(5, p.getPaymentNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int updateStatus(Connection conn, int reserveNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update reserve set payment_status = 'true' where reserve_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reserveNo);
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
