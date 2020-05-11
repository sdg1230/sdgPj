package reserve.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import reserve.vo.Reserve;

public class ReserveDao {

	public ArrayList<Reserve> selectAllReserve(Connection conn) {
		ArrayList<Reserve> list = new ArrayList<Reserve>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query="select reserveNo,memberId,salonName,designerNo,reserveDate,startTime,reserveTime,totalPrice,memberName,designerName from reserve join member on(reserve)";
		
		private int reserveNo;
		private String memberId;
		private String salonName;
		private int designerNo;
		private String reserveDate;
		private int startTime;
		private int reserveTime;
		private int totalPrice;
		private String memberName;
		private String designerName;
		
		return list;
	}

}
