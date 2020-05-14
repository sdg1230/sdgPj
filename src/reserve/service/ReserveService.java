package reserve.service;

import java.sql.Connection;
import java.util.ArrayList;
<<<<<<< HEAD
import java.util.Date;


import common.JDBCTemplate;
import reserve.dao.ReserveDao;
import reserve.vo.Reserve;


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

	public int changeResultStatus(int reserveNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReserveDao().changeReserveStatus(conn,reserveNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}

	public int deleteOldReserve() {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReserveDao().deleteOldReserve(conn);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
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
