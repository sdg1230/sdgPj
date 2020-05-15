package event.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import event.model.dao.EventDao;
import evnet.model.vo.Event;

public class EventService {

	public int insertEvent(Event e) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new EventDao().insertEvent(conn,e);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<Event> selectEventList() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Event> list = new EventDao().selectEventList(conn);
		JDBCTemplate.close(conn);
		return list;
	}

}
