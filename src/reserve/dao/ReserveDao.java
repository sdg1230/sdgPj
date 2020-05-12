package reserve.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.tomcat.dbcp.dbcp2.Jdbc41Bridge;

import common.JDBCTemplate;
import reserve.vo.Reserve;
import reserve.vo.ReserveDetail;

public class ReserveDao {
	
	public ArrayList<Reserve> selectAllReserve(Connection conn, String salonName, String status) {
		ArrayList<Reserve> rlist = new ArrayList<Reserve>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select reserve_no,member_id,member_name,member_phone,reserve.salon_name,designer_no,designer_name,reserve_date,start_time,reserve_time,total_price,reserve_status,payment_status from reserve join member using(member_id) join designer using(designer_no) where reserve.salon_name=? and reserve_status=? order by reserve_date desc";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, salonName);
			pstmt.setString(2, status);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Reserve r = new Reserve();
				r.setDesignerName(rset.getString("designer_name"));
				r.setDesignerNo(rset.getInt("designer_no"));
				r.setMemberId(rset.getString("member_id"));
				r.setMemberName(rset.getString("member_name"));
				r.setMemberPhone(rset.getString("member_phone"));
				r.setReserveDate(rset.getString("reserve_date"));
				r.setReserveNo(rset.getInt("reserve_no"));
				r.setReserveTime(rset.getInt("reserve_time"));
				r.setSalonName(rset.getString("salon_name"));
				r.setStartTime(rset.getInt("start_time"));
				r.setTotalPrice(rset.getInt("total_price"));
				r.setReserveStatus(rset.getString("reserve_status"));
				r.setPaymentStatus(rset.getString("payment_status"));
				rlist.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return rlist;
	}

	public ArrayList<ReserveDetail> selectAllReserveDetail(Connection conn, int reserveNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReserveDetail> dlist = new ArrayList<ReserveDetail>();
		String query = "select * from reserve_detail where reserve_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reserveNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				ReserveDetail rd = new ReserveDetail();
				rd.setReserveNo(rset.getInt("reserve_no"));
				rd.setHairNo(rset.getInt("hair_no"));
				rd.setHairName(rset.getString("hair_name"));
				dlist.add(rd);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return dlist;
	}



}
