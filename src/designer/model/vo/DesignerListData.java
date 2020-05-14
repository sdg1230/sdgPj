package designer.model.vo;

import java.util.ArrayList;

public class DesignerListData {
	private ArrayList<Designer> designerList;
	private ArrayList<String> salonList;
	public DesignerListData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DesignerListData(ArrayList<Designer> designerList, ArrayList<String> salonList) {
		super();
		this.designerList = designerList;
		this.salonList = salonList;
	}
	public ArrayList<Designer> getDesignerList() {
		return designerList;
	}
	public void setDesignerList(ArrayList<Designer> designerList) {
		this.designerList = designerList;
	}
	public ArrayList<String> getSalonList() {
		return salonList;
	}
	public void setSalonList(ArrayList<String> salonList) {
		this.salonList = salonList;
	}
	
}
