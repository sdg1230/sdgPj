package reserve.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import reserve.dao.ReserveDao;
import reserve.vo.Reserve;
import reserve.vo.ReserveDetail;

public class ReserveService {

	public ArrayList<Reserve> selectAllReserve(String salonName, String status) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Reserve> rlist = new ReserveDao().selectAllReserve(conn, salonName,status);
		if (!rlist.isEmpty()) {
			for (Reserve r : rlist) {
				r.setMenuList(new ReserveDao().selectAllReserveDetail(conn, r.getReserveNo()));
			}
		}
		JDBCTemplate.close(conn);
		return rlist;
	}
}
