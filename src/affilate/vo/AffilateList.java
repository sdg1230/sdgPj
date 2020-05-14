package affilate.vo;

import java.util.ArrayList;




public class AffilateList {
	private ArrayList<Affilate> affilateList;
	private ArrayList<AffilateStar> reviewStar;
	private String pageNavi;
	public AffilateList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AffilateList(ArrayList<Affilate> affilateList, String pageNavi, ArrayList<AffilateStar> reviewStar) {
		super();
		this.affilateList = affilateList;
		this.reviewStar = reviewStar;
		this.pageNavi = pageNavi;
	}
	
	public ArrayList<AffilateStar> getReviewStar() {
		return reviewStar;
	}
	public void setReviewStar(ArrayList<AffilateStar> reviewStar) {
		this.reviewStar = reviewStar;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	public ArrayList<Affilate> getAffilateList() {
		return affilateList;
	}
	public void setAffilateList(ArrayList<Affilate> affilateList) {
		this.affilateList = affilateList;
	}
	
	
}
