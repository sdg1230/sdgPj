package reserve.vo;

public class HairMenu {
    private int hairNo;
	private String hairName;
	private int hairPay;
	private int hairTime;
	public HairMenu() {
		super();
		// TODO Auto-generated constructor stub
	}
	public HairMenu(int hairNo, String hairName, int hairPay, int hairTime) {
		super();
		this.hairNo = hairNo;
		this.hairName = hairName;
		this.hairPay = hairPay;
		this.hairTime = hairTime;
	}
	public int getHairNo() {
		return hairNo;
	}
	public void setHairNo(int hairNo) {
		this.hairNo = hairNo;
	}
	public String getHairName() {
		return hairName;
	}
	public void setHairName(String hairName) {
		this.hairName = hairName;
	}
	public int getHairPay() {
		return hairPay;
	}
	public void setHairPay(int hairPay) {
		this.hairPay = hairPay;
	}
	public int getHairTime() {
		return hairTime;
	}
	public void setHairTime(int hairTime) {
		this.hairTime = hairTime;
	}
}
