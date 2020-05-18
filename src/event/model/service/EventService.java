package event.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import event.model.dao.EventDao;
import event.model.vo.EndEvent;
import event.model.vo.Event;

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

	public Event eventDetail(int eventNo) {
		Connection conn = JDBCTemplate.getConnection();
		Event e = new EventDao().eventDetail(conn,eventNo);
		JDBCTemplate.close(conn);
		return e;
	}

	public int deleteEvent(int eventNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new EventDao().deleteEvent(conn,eventNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<EndEvent> selectEndList() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<EndEvent> endlist = new EventDao().selectEndList(conn);
		JDBCTemplate.close(conn);
		return endlist;
	}

}
