package salon.vo;

public class Salon {
	private int salonNo;
	private String salonName;
	private String salonPhone;
	private String salonAddr;
	private String salonInfo;
	private String salonFilename;
	private String salonFilepath;
	private double reviewStar;
	public Salon() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Salon(int salonNo, String salonName, String salonPhone, String salonAddr, String salonInfo,
			String salonFilename, String salonFilepath, double reviewStar) {
		super();
		this.reviewStar = reviewStar;
		this.salonNo = salonNo;
		this.salonName = salonName;
		this.salonPhone = salonPhone;
		this.salonAddr = salonAddr;
		this.salonInfo = salonInfo;
		this.salonFilename = salonFilename;
		this.salonFilepath = salonFilepath;
	}
	
	public double getReviewStar() {
		return reviewStar;
	}
	public void setReviewStar(double reviewStar) {
		this.reviewStar = reviewStar;
	}
	public int getSalonNo() {
		return salonNo;
	}
	public void setSalonNo(int salonNo) {
		this.salonNo = salonNo;
	}
	public String getSalonName() {
		return salonName;
	}
	public void setSalonName(String salonName) {
		this.salonName = salonName;
	}
	public String getSalonPhone() {
		return salonPhone;
	}
	public void setSalonPhone(String salonPhone) {
		this.salonPhone = salonPhone;
	}
	public String getSalonAddr() {
		return salonAddr;
	}
	public void setSalonAddr(String salonAddr) {
		this.salonAddr = salonAddr;
	}
	public String getSalonInfo() {
		return salonInfo;
	}
	public void setSalonInfo(String salonInfo) {
		this.salonInfo = salonInfo;
	}
	public String getSalonFilename() {
		return salonFilename;
	}
	public void setSalonFilename(String salonFilename) {
		this.salonFilename = salonFilename;
	}
	public String getSalonFilepath() {
		return salonFilepath;
	}
	public void setSalonFilepath(String salonFilepath) {
		this.salonFilepath = salonFilepath;
	}
	
}
