package pay.model.vo;

import java.sql.Date;

public class Pay {
	private int reserveNo;
	private String memberId;
	private int paymentPrice;
	private Date paymentDate;
	private String paymentId;
	private String paymentNo;
	public Pay() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Pay(int reserveNo, String memberId, int paymentPrice, Date paymentDate, String paymentId, String paymentNo) {
		super();
		this.reserveNo = reserveNo;
		this.memberId = memberId;
		this.paymentPrice = paymentPrice;
		this.paymentDate = paymentDate;
		this.paymentId = paymentId;
		this.paymentNo = paymentNo;
	}
	public int getReserveNo() {
		return reserveNo;
	}
	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getPaymentPrice() {
		return paymentPrice;
	}
	public void setPaymentPrice(int paymentPrice) {
		this.paymentPrice = paymentPrice;
	}
	public Date getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}
	public String getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}
	public String getPaymentNo() {
		return paymentNo;
	}
	public void setPaymentNo(String paymentNo) {
		this.paymentNo = paymentNo;
	}

	
}
