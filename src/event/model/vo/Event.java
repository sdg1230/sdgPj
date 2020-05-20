package event.model.vo;

import java.sql.Date;

public class Event {
	private int eventNo;
	private String eventTitle;
	private String eventContent;
	private Date eventDate;
	private String eventFilename;
	private String eventFilepath;
	public Event() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Event(int eventNo, String eventTitle, String eventContent, Date eventDate, String eventFilename,
			String eventFilepath) {
		super();
		this.eventNo = eventNo;
		this.eventTitle = eventTitle;
		this.eventContent = eventContent;
		this.eventDate = eventDate;
		this.eventFilename = eventFilename;
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
	public String getEventContent() {
		return eventContent;
	}
	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}
	public Date getEventDate() {
		return eventDate;
	}
	public void setEventDate(Date eventDate) {
		this.eventDate = eventDate;
	}
	public String getEventFilename() {
		return eventFilename;
	}
	public void setEventFilename(String eventFilename) {
		this.eventFilename = eventFilename;
	}
	public String getEventFilepath() {
		return eventFilepath;
	}
	public void setEventFilepath(String eventFilepath) {
		this.eventFilepath = eventFilepath;
	}
	
	
}
