package salon.vo;

import java.util.ArrayList;

import salonReview.vo.SalonReview;




public class SalonList {
	private ArrayList<Salon> affilateList;
	private ArrayList<SalonReview> reviewStar;
	private String pageNavi;
	public SalonList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SalonList(ArrayList<Salon> affilateList, String pageNavi, ArrayList<SalonReview> reviewStar) {
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
	public ArrayList<Salon> getAffilateList() {
		return affilateList;
	}
	public void setAffilateList(ArrayList<Salon> affilateList) {
		this.affilateList = affilateList;
	}
	
	
}
