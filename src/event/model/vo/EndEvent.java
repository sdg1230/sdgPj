package event.model.vo;

import java.sql.Date;

public class EndEvent {
	private int eventNo;
	private String eventTitle;
	private Date eventDate;
	private String eventFilepath;
	public EndEvent() {
		super();
		// TODO Auto-generated constructor stub
	}
	public EndEvent(int eventNo, String eventTitle, Date eventDate, String eventFilepath) {
		super();
		this.eventNo = eventNo;
		this.eventTitle = eventTitle;
		this.eventDate = eventDate;
		this.eventFilepath = eventFilepath;
	}
	public int getEventNo() {
		return eventNo;
	}
	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}
	public String getEventTitle() {
		return eventTitle;
	}
	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}
	public Date getEventDate() {
		return eventDate;
	}
	public void setEventDate(Date eventDate) {
		this.eventDate = eventDate;
	}
	public String getEventFilepath() {
		return eventFilepath;
	}
	public void setEventFilepath(String eventFilepath) {
		this.eventFilepath = eventFilepath;
	}
	
	
}
