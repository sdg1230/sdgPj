package affilate.vo;

import java.util.ArrayList;

import salonReview.vo.SalonReview;




public class AffilateList {
	private ArrayList<Affilate> affilateList;
	private ArrayList<SalonReview> reviewStar;
	private String pageNavi;
	public AffilateList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AffilateList(ArrayList<Affilate> affilateList, String pageNavi, ArrayList<SalonReview> reviewStar) {
		super();
		this.affilateList = affilateList;
		this.reviewStar = reviewStar;
		this.pageNavi = pageNavi;
	}
	
	public ArrayList<SalonReview> getReviewStar() {
		return reviewStar;
	}
	public void setReviewStar(ArrayList<SalonReview> reviewStar) {
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
