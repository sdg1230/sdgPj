package designer.model.vo;

public class Designer {
	private int designerNo;
	private String salonName;
	private String designerName;
	private String designerInfo;
	private String designerFilename;
	private String designerFilepath;
	public Designer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Designer(int designerNo, String salonName, String designerName, String designerInfo, String designerFilename,
			String designerFilepath) {
		super();
		this.designerNo = designerNo;
		this.salonName = salonName;
		this.designerName = designerName;
		this.designerInfo = designerInfo;
		this.designerFilename = designerFilename;
		this.designerFilepath = designerFilepath;
	}
	public int getDesignerNo() {
		return designerNo;
	}
	public void setDesignerNo(int designerNo) {
		this.designerNo = designerNo;
	}
	public String getSalonName() {
		return salonName;
	}
	public void setSalonName(String salonName) {
		this.salonName = salonName;
	}
	public String getDesignerName() {
		return designerName;
	}
	public void setDesignerName(String designerName) {
		this.designerName = designerName;
	}
	public String getDesignerInfo() {
		return designerInfo;
	}
	public void setDesignerInfo(String designerInfo) {
		this.designerInfo = designerInfo;
	}
	public String getDesignerFilename() {
		return designerFilename;
	}
	public void setDesignerFilename(String designerFilename) {
		this.designerFilename = designerFilename;
	}
	public String getDesignerFilepath() {
		return designerFilepath;
	}
	public void setDesignerFilepath(String designerFilepath) {
		this.designerFilepath = designerFilepath;
	}
	
	
}
