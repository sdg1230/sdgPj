package reserve.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import reserve.vo.HairMenu;
import reserve.vo.Reserve;
import reserve.vo.ReserveDetail;

public class ReserveDao {
	
	public ArrayList<Reserve> selectAllReserve(Connection conn, String salonName, String status) {
		ArrayList<Reserve> rlist = new ArrayList<Reserve>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select reserve_no,member_id,member_name,member_phone,reserve.salon_name,designer_no,designer_name,reserve_date,start_time,reserve_time,total_price,reserve_status,payment_status,reserve_review from reserve join member using(member_id) join designer using(designer_no) where reserve.salon_name=? and reserve_status=? order by reserve_date desc";
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
				r.setReserveReview(rset.getString("reserve_review"));
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

	public ArrayList<HairMenu> selectHairMenu(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HairMenu> hairMenuList = new ArrayList<HairMenu>();
		String query = "select * from hair_menu";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				HairMenu h = new HairMenu();
				h.setHairNo(rset.getInt("hair_no"));
				h.setHairName(rset.getString("hair_name"));
				h.setHairPay(rset.getInt("hair_pay"));
				h.setHairTime(rset.getInt("hair_time"));
				hairMenuList.add(h);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return hairMenuList;
	}

	public ArrayList<Reserve> selectReserveTime(Connection conn, String reserveDate, String salonName,
			int designerNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Reserve> rlist = new ArrayList<Reserve>();
		String query = "select start_time,reserve_time from reserve where reserve_date=? and salon_name=? and designer_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, reserveDate);
			pstmt.setString(2, salonName);
			pstmt.setInt(3, designerNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Reserve r = new Reserve();
				r.setStartTime(rset.getInt("start_time"));
				r.setReserveTime(rset.getInt("reserve_time"));
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
				r.setReserveDate(rset.getString("reserve_date"));
				r.setReserveNo(rset.getInt("reserve_no"));
				r.setReserveTime(rset.getInt("reserve_time"));
				r.setSalonName(rset.getString("salon_name"));
				r.setMemberPhone(rset.getString("member_phone"));
				r.setPaymentStatus(rset.getString("payment_status"));
				r.setReserveStatus(rset.getString("reserve_status"));
				r.setReserveReview(rset.getString("reserve_review"));
				r.setStartTime(rset.getInt("start_time"));
				r.setTotalPrice(rset.getInt("total_price"));
				list.add(r);
			
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

	public ArrayList<ReserveDetail> reserveDetailList(Connection conn, int reserveNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from reserve_detail where reserve_no=?";
		ArrayList<ReserveDetail> rlist = new ArrayList<ReserveDetail>();
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reserveNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				ReserveDetail r = new ReserveDetail();
				r.setReserveNo(rset.getInt("reserve_no"));
				r.setHairNo(rset.getInt("hair_no"));
				r.setHairName(rset.getString("hair_name"));
				rlist.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
				r.setReserveReview(rset.getString("reserve_review"));
				r.setStartTime(rset.getInt("start_time"));
				r.setTotalPrice(rset.getInt("total_price"));
				list.add(r);
			
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

	public int insertReserve(Connection conn, Reserve r) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into reserve values(SEQ_RESERVE_NO.NEXTVAL,?,?,?,?,?,?,?,'false','false','false')";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, r.getMemberId());
			pstmt.setString(2, r.getSalonName());
			pstmt.setInt(3, r.getDesignerNo());
			pstmt.setString(4, r.getReserveDate());
			pstmt.setInt(5, r.getStartTime());
			pstmt.setInt(6, r.getReserveTime());
			pstmt.setInt(7, r.getTotalPrice());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int selectReserveBymemberId(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int reserveNo = 0;
		String query = "select reserve_no from reserve where member_id=? order by reserve_no desc";
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				reserveNo = rset.getInt("reserve_no");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return reserveNo;
	}

	public int insertReserveDetail(Connection conn, int reserveNo, int nhair) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into reserve_detail values(?,?,(select hair_name from hair_menu where hair_no=?))";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reserveNo);
			pstmt.setInt(2, nhair);
			pstmt.setInt(3, nhair);
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