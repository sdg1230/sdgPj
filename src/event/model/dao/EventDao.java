package event.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import event.model.vo.EndEvent;
import event.model.vo.Event;

public class EventDao {

	public int insertEvent(Connection conn, Event e) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into event values(seq_event_no.nextval,?,?,sysdate,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, e.getEventTitle());
			pstmt.setString(2, e.getEventContent());
			pstmt.setString(3, e.getEventFilename());
			pstmt.setString(4, e.getEventFilepath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally {
			
			JDBCTemplate.close(conn);
		}
		return result;
	}

	public ArrayList<Event> selectEventList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Event> list = new ArrayList<Event>();
		String query = "select * from event order by event_no desc";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Event e = new Event();
				e.setEventContent(rset.getString("event_content"));
				e.setEventDate(rset.getDate("event_date"));
				e.setEventFilename(rset.getString("event_filename"));
				e.setEventFilepath(rset.getString("event_filepath"));
				e.setEventNo(rset.getInt("event_no"));
				e.setEventTitle(rset.getString("event_title"));
				
				list.add(e);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return list;
	}

	public Event eventDetail(Connection conn, int eventNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from event where event_no = ?";
		Event e = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, eventNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				e = new Event();
				e.setEventContent(rset.getString("event_content"));
				e.setEventDate(rset.getDate("event_date"));
				e.setEventFilename(rset.getString("event_filename"));
				e.setEventFilepath(rset.getString("event_filepath"));
				e.setEventTitle(rset.getString("event_title"));
				e.setEventNo(rset.getInt("event_no"));
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return e;
	}

	public int deleteEvent(Connection conn, int eventNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from event where event_no =?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, eventNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<EndEvent> selectEndList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from end_event order by event_no desc";
		ArrayList<EndEvent> endlist = new ArrayList<EndEvent>();
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				EndEvent ee = new EndEvent();
				ee.setEventDate(rset.getDate("event_date"));
				ee.setEventFilepath(rset.getString("event_filepath"));
				ee.setEventNo(rset.getInt("event_no"));
				ee.setEventTitle(rset.getString("event_title"));
				endlist.add(ee);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return endlist;
	}

	public Event selectEventOne(Connection conn, int eventNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from event where event_no = ?";
		Event e = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, eventNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				e = new Event();
				e.setEventContent(rset.getString("event_content"));
				e.setEventDate(rset.getDate("event_date"));
				e.setEventFilename(rset.getString("event_filename"));
				e.setEventFilepath(rset.getString("event_filepath"));
				e.setEventNo(rset.getInt("event_no"));
				e.setEventTitle(rset.getString("event_title"));
				
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return e;
	}

	public int modifyEvent(Connection conn, int eventNo, Event e) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update event set event_title = ?,event_content=? where event_no= ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, e.getEventTitle());
			pstmt.setString(2, e.getEventContent());
			pstmt.setInt(3, eventNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

}
