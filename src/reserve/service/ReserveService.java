package reserve.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import reserve.dao.ReserveDao;
import reserve.vo.Reserve;
import reserve.vo.ReserveDetail;

public class ReserveService {

	public ArrayList<Reserve> reserveList(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Reserve>list = new ReserveDao().reserveList(conn,memberId);		
		
		if(!list.isEmpty()) {
			for(Reserve rlist : list) {
				rlist.setMenuList(new ReserveDao().reserveDetailList(conn, rlist.getReserveNo()));				
			}						
		}
		System.out.println(list.size());
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<Reserve> searchReserve(int reserveNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Reserve> list = new ReserveDao().reserveNo(conn,reserveNo);		
		
		if(!list.isEmpty()) {
			for(Reserve rlist : list) {
				rlist.setMenuList(new ReserveDao().reserveDetailList(conn, rlist.getReserveNo()));				
			}						
		}
		JDBCTemplate.close(conn);
		return list;
	}
	

}
