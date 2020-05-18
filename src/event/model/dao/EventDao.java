package event.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
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
		String query = "select * from event";
		
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

}
