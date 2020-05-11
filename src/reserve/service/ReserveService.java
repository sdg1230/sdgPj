package reserve.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import reserve.dao.ReserveDao;
import reserve.vo.Reserve;
import reserve.vo.ReserveDetail;

public class ReserveService {

	public ArrayList<Reserve> selectAllReserve() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Reserve> list = new ReserveDao().selectAllReserve(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<ReserveDetail> selectAllReserveDetail() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<ReserveDetail> dlist = new ReserveDao().selectAllReserveDetail(conn);
		JDBCTemplate.close(conn);
		return dlist;
	}
	
}
