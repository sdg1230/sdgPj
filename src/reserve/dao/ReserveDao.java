package reserve.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import reserve.vo.Reserve;
import reserve.vo.ReserveDetail;

public class ReserveDao {

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

}
