package salonReview.vo;

import java.sql.Date;

public class SalonReview {
	private int reserveNo;
	private String salonName;
	private String reviewWriter;
	private int reviewStar;
	private String reviewComment;
	private Date reviewDate;
	public SalonReview() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SalonReview(int reserveNo, String salonName, String reviewWriter, int reviewStar, String reviewComment,
			Date reviewDate) {
		super();
		this.reserveNo = reserveNo;
		this.salonName = salonName;
		this.reviewWriter = reviewWriter;
		this.reviewStar = reviewStar;
		this.reviewComment = reviewComment;
		this.reviewDate = reviewDate;
	}
	public int getReserveNo() {
		return reserveNo;
	}
	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
	}
	public String getSalonName() {
		return salonName;
	}
	public void setSalonName(String salonName) {
		this.salonName = salonName;
	}
	public String getReviewWriter() {
		return reviewWriter;
	}
	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}
	public int getReviewStar() {
		return reviewStar;
	}
	public void setReviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
	}
	public String getReviewComment() {
		return reviewComment;
	}
	public void setReviewComment(String reviewComment) {
		this.reviewComment = reviewComment;
	}
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	
}
