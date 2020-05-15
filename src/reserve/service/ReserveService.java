package reserve.service;

import java.sql.Connection;
import java.util.ArrayList;

import java.util.Date;


import common.JDBCTemplate;
import reserve.dao.ReserveDao;
import reserve.vo.HairMenu;
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
	
	public ArrayList<HairMenu> selectHairMenu() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<HairMenu> hairMenuList = new ReserveDao().selectHairMenu(conn);
		JDBCTemplate.close(conn);
		return hairMenuList;
	}

	public ArrayList<Reserve> selectReserveTime(String reserveDate, String salonName, int designerNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Reserve> rlist = new ReserveDao().selectReserveTime(conn,reserveDate,salonName,designerNo);
		JDBCTemplate.close(conn);
		return rlist;
	}

	public int insertReserve(Reserve r, String[] hairNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result1 = new ReserveDao().insertReserve(conn,r);
		if(result1>0) {
			int reserveNo = new ReserveDao().selectReserveBymemberId(conn,r.getMemberId());
			int cnt=0;
			for(String hair : hairNo) {
				int nhair = Integer.parseInt(hair);
				int result2 = new ReserveDao().insertReserveDetail(conn,reserveNo,nhair);
				if(result2>0) {
					cnt++;
				}
			}
			if(cnt==hairNo.length) {
				result1+=cnt;
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result1;
	}

}
