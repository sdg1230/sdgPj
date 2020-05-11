package reserve.vo;

public class Reserve {
	private int reserveNo;
	private String memberId;
	private String salonName;
	private int designerNo;
	private String reserveDate;
	private int startTime;
	private int reserveTime;
	private int totalPrice;
	private String memberName;
	private String designerName;
	public Reserve() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Reserve(int reserveNo, String memberId, String salonName, int designerNo, String reserveDate, int startTime,
			int reserveTime, int totalPrice, String memberName, String designerName) {
		super();
		this.reserveNo = reserveNo;
		this.memberId = memberId;
		this.salonName = salonName;
		this.designerNo = designerNo;
		this.reserveDate = reserveDate;
		this.startTime = startTime;
		this.reserveTime = reserveTime;
		this.totalPrice = totalPrice;
		this.memberName = memberName;
		this.designerName = designerName;
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
	public String getSalonName() {
		return salonName;
	}
	public void setSalonName(String salonName) {
		this.salonName = salonName;
	}
	public int getDesignerNo() {
		return designerNo;
	}
	public void setDesignerNo(int designerNo) {
		this.designerNo = designerNo;
	}
	public String getReserveDate() {
		return reserveDate;
	}
	public void setReserveDate(String reserveDate) {
		this.reserveDate = reserveDate;
	}
	public int getStartTime() {
		return startTime;
	}
	public void setStartTime(int startTime) {
		this.startTime = startTime;
	}
	public int getReserveTime() {
		return reserveTime;
	}
	public void setReserveTime(int reserveTime) {
		this.reserveTime = reserveTime;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getDesignerName() {
		return designerName;
	}
	public void setDesignerName(String designerName) {
		this.designerName = designerName;
	}
}
