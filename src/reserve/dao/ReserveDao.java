package reserve.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

<<<<<<< HEAD
import org.apache.tomcat.dbcp.dbcp2.Jdbc41Bridge;

=======
>>>>>>> hogilversion0.01
import common.JDBCTemplate;
import reserve.vo.Reserve;
import reserve.vo.ReserveDetail;

public class ReserveDao {
<<<<<<< HEAD
	
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
=======

	public ArrayList<Reserve> reserveList(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Reserve>list = new ArrayList<Reserve>(); 
		String query = "select * from member,reserve,designer,salon,reserve_detail where member.member_id=reserve.member_id and reserve.reserve_no=reserve_detail.reserve_no and reserve.designer_no=designer.designer_no and reserve.salon_name=salon.salon_name and member.member_id=? order by reserve_date desc";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			System.out.println(memberId);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Reserve r = new Reserve();
				System.out.println("test");
				r.setDesignerNo(rset.getInt("designer_no"));
				r.setDesignerName(rset.getString("designer_name"));
				r.setMemberId(rset.getString("member_id"));
				r.setMemberName(rset.getString("member_name"));
>>>>>>> hogilversion0.01
				r.setReserveDate(rset.getString("reserve_date"));
				r.setReserveNo(rset.getInt("reserve_no"));
				r.setReserveTime(rset.getInt("reserve_time"));
				r.setSalonName(rset.getString("salon_name"));
<<<<<<< HEAD
				r.setStartTime(rset.getInt("start_time"));
				r.setTotalPrice(rset.getInt("total_price"));
				r.setReserveStatus(rset.getString("reserve_status"));
				r.setPaymentStatus(rset.getString("payment_status"));
				rlist.add(r);
			}
=======
				r.setMemberPhone(rset.getString("member_phone"));
				r.setPaymentStatus(rset.getString("payment_status"));
				r.setReserveStatus(rset.getString("reserve_status"));
				r.setStartTime(rset.getInt("start_time"));
				r.setTotalPrice(rset.getInt("total_price"));
				r.setReserveReview(rset.getString("reserve_review"));
				list.add(r);
			
			}
			
>>>>>>> hogilversion0.01
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
<<<<<<< HEAD
		return rlist;
	}

	public ArrayList<ReserveDetail> selectAllReserveDetail(Connection conn, int reserveNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReserveDetail> dlist = new ArrayList<ReserveDetail>();
		String query = "select * from reserve_detail where reserve_no=?";
=======
		return list;
	}

	

	public ArrayList<ReserveDetail> reserveDetailList(Connection conn, int reserveNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from reserve_detail where reserve_no=?";
		ArrayList<ReserveDetail> rlist = new ArrayList<ReserveDetail>();
>>>>>>> hogilversion0.01
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reserveNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
<<<<<<< HEAD
				ReserveDetail rd = new ReserveDetail();
				rd.setReserveNo(rset.getInt("reserve_no"));
				rd.setHairNo(rset.getInt("hair_no"));
				rd.setHairName(rset.getString("hair_name"));
				dlist.add(rd);
=======
				ReserveDetail r = new ReserveDetail();
				r.setReserveNo(rset.getInt("reserve_no"));
				r.setHairNo(rset.getInt("hair_no"));
				r.setHairName(rset.getString("hair_name"));
				rlist.add(r);
>>>>>>> hogilversion0.01
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
<<<<<<< HEAD
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return dlist;
	}

	public int changeReserveStatus(Connection conn, int reserveNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update reserve set reserve_status='true' where reserve_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reserveNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(conn);
		}
		return result;
	}

	public ArrayList<Reserve> selectAllReserve(Connection conn) {
		ArrayList<Reserve> rlist = new ArrayList<Reserve>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from reserve";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Reserve r = new Reserve();
				r.setReserveNo(rset.getInt("reserve_no"));
				r.setReserveDate(rset.getString("reserve_date"));
				r.setReserveStatus(rset.getString("reserve_status"));
				rlist.add(r);
=======
		}
		return rlist;
	}



	public ArrayList<Reserve> reserveNo(Connection conn, int reserveNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Reserve>list = new ArrayList<Reserve>(); 
		String query = "select * from member,reserve,designer,salon,reserve_detail where member.member_id=reserve.member_id and reserve.reserve_no=reserve_detail.reserve_no and reserve.designer_no=designer.designer_no and reserve.salon_name=salon.salon_name and reserve.reserve_no=? order by reserve_date desc";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reserveNo);
			System.out.println(reserveNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Reserve r = new Reserve();
				System.out.println("test");
				r.setDesignerNo(rset.getInt("designer_no"));
				r.setDesignerName(rset.getString("designer_name"));
				r.setMemberId(rset.getString("member_id"));
				r.setMemberName(rset.getString("member_name"));
				r.setReserveDate(rset.getString("reserve_date"));
				r.setReserveNo(rset.getInt("reserve_no"));
				r.setReserveTime(rset.getInt("reserve_time"));
				r.setSalonName(rset.getString("salon_name"));
				r.setMemberPhone(rset.getString("member_phone"));
				r.setPaymentStatus(rset.getString("payment_status"));
				r.setReserveStatus(rset.getString("reserve_status"));
				r.setStartTime(rset.getInt("start_time"));
				r.setTotalPrice(rset.getInt("total_price"));
				list.add(r);
			
>>>>>>> hogilversion0.01
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
<<<<<<< HEAD
		return rlist;
	}

	public int deleteOldReserve(Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from reserve where (sysdate-to_date(reserve_date,'yyyy-mm-dd'))>1 and reserve_status='false' and payment_status='false'";
		try {
			pstmt = conn.prepareStatement(query);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}



=======
		return list;
	}

>>>>>>> hogilversion0.01
}
