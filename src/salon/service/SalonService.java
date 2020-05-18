package salon.service;

import java.sql.Connection;



import java.util.ArrayList;



import common.JDBCTemplate;
import designer.model.vo.Designer;
import salon.dao.SalonDao;
import salon.vo.Salon;
import salon.vo.SalonDetails;
import salon.vo.SalonList;
import salonReview.vo.SalonReview;


public class SalonService {

	public SalonList selectAffilate(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 10;
		int totalCount = new SalonDao().totalCount(conn);
		int totalPage =0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		ArrayList<Salon> list = new SalonDao().selectAffilate(conn,start,end);
		if(!list.isEmpty()) {
			for(Salon s : list) {
				s.setReviewStar(new SalonDao().selectSolonRevuew1(conn,s.getSalonName()));
				
			}
		}
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo != 1) {
			pageNavi +="<a class='btn' href='/branchList?reqPage="+(pageNo-pageNaviSize)+
					"'>이전</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(reqPage == pageNo) {
				pageNavi +="<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi +="<a class='btn' href='/branchList?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi +="<a class='btn' href='/branchList?reqPage="+pageNo+
					"'>다음</a>";
		}
		
		SalonList pd = new SalonList(list,pageNavi,null);
		JDBCTemplate.close(conn);
		return pd;
	}

	public ArrayList<Salon> selectAffilate(String sq) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Salon> list = new SalonDao().selectSolonRevuew(conn,sq);
		if(!list.isEmpty()) {
			for(Salon s : list) {
				s.setReviewStar(new SalonDao().selectSolonRevuew1(conn,s.getSalonName()));
			}
		}
		
		JDBCTemplate.close(conn);
		return list;
	}

	public SalonList selectAffilates(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 10;
		int totalCount = new SalonDao().totalCount(conn);
		int totalPage =0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		ArrayList<Salon> list = new SalonDao().selectAffilates(conn,start,end);
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo != 1) {
			pageNavi +="<a class='btn' href='/branchmanagement?reqPage="+(pageNo-pageNaviSize)+
					"'>이전</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(reqPage == pageNo) {
				pageNavi +="<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi +="<a class='btn' href='/branchmanagement?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi +="<a class='btn' href='/branchmanagement?reqPage="+pageNo+
					"'>다음</a>";
		}
		
		
		SalonList pd = new SalonList(list,pageNavi,null);
		JDBCTemplate.close(conn);
		return pd;
	}

	public SalonList selectdelete(String salonName) {
		ArrayList<Salon> list = null;
		String pageNavi = "";
		Connection conn = JDBCTemplate.getConnection();
		int result = new SalonDao().salonDelete(conn,salonName);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
			
			int reqPage =1;
			int numPerPage = 10;
			int totalCount = new SalonDao().totalCount(conn);
			int totalPage =0;
			if(totalCount%numPerPage == 0) {
				totalPage = totalCount/numPerPage;
			}else {
				totalPage = totalCount/numPerPage+1;
			}
			
			int start = (reqPage-1)*numPerPage+1;
			int end = reqPage*numPerPage;
			list = new SalonDao().selectAffilates(conn,start,end);
			
			int pageNaviSize = 5;
			int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
			if(pageNo != 1) {
				pageNavi +="<a class='btn' href='/branchmanagement?reqPage="+(pageNo-pageNaviSize)+
						"'>이전</a>";
			}
			for(int i=0;i<pageNaviSize;i++) {
				if(reqPage == pageNo) {
					pageNavi +="<span class='selectPage'>"+pageNo+"</span>";
				}else {
					pageNavi +="<a class='btn' href='/branchmanagement?reqPage="+pageNo+"'>"+pageNo+"</a>";
				}
				pageNo++;
				if(pageNo>totalPage) {
					break;
				}
			}
			if(pageNo <= totalPage) {
				pageNavi +="<a class='btn' href='/branchmanagement?reqPage="+pageNo+
						"'>다음</a>";
			}
			
			
		}else {
			
			JDBCTemplate.rollback(conn);
		}
		
		SalonList pd = new SalonList(list,pageNavi,null);
		JDBCTemplate.close(conn);
		return pd;
		
	}

	

	public Salon salonUpdateFrm(String salonName) {
		Connection conn = JDBCTemplate.getConnection();
		Salon aff =  new SalonDao().salonSelect(conn,salonName);
		JDBCTemplate.close(conn);
		return aff;
	}

	public int salonUpdate(Salon aff) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new SalonDao().salonUpdate(conn,aff);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int insertAffilatr(Salon aff) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new SalonDao().insertAffilatr(conn,aff);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<Salon> selectSalon() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Salon> list = new SalonDao().selectSalon(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public SalonDetails salonDetails(String salonName, int reqPage) {
		Connection conn =  JDBCTemplate.getConnection();
		Salon sa =  new SalonDao().salonSelect(conn, salonName);
		
		
		int numPerPage = 10;
		int totalCount = new SalonDao().totalCountSalon(conn,salonName);
		
		int totalPage =0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		ArrayList<SalonReview> list = new SalonDao().salonSelect(conn,start,end,salonName);
		String pageNavi = "";
		
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo != 1) {
			pageNavi +="<a class='btn' href='/selectSalon?reqPage="+(pageNo-pageNaviSize)+
					"&salonName="+sa.getSalonName()+"'>이전</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(reqPage == pageNo) {
				pageNavi +="<span class='selectPage btn'>"+pageNo+"</span>";
			}else {
				pageNavi +="<a class='btn' href='/selectSalon?reqPage="+pageNo+"&salonName="+sa.getSalonName()+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi +="<a class='btn' href='/selectSalon?reqPage="+pageNo+"&salonName="+sa.getSalonName()+
					"'>다음</a>";
		}
		ArrayList<Designer> designerList = new SalonDao().salondesigner(conn, salonName);
		SalonReview star = new SalonDao().salonstar(conn,salonName);
		
		SalonDetails sd =  new SalonDetails(sa, pageNavi, designerList, list,star);
		return sd;
	}


	public ArrayList<Salon> selectAffilateAddr(String sq) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Salon> list = new SalonDao().selectSolonRevuewAddr(conn,sq);
		if(!list.isEmpty()) {
			for(Salon s : list) {
				s.setReviewStar(new SalonDao().selectSolonRevuew1(conn,s.getSalonName()));
			}
		}
		JDBCTemplate.close(conn);
		return list;
	}


	public ArrayList<Salon> selectBestSalon() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Salon> list = new SalonDao().selectBestSalon(conn);
		JDBCTemplate.close(conn);
		return list;
	}

}
