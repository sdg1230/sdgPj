package affilate.service;

import java.sql.Connection;

import java.util.ArrayList;

import affilate.dao.AffilateDao;
import affilate.vo.Affilate;
import affilate.vo.AffilateList;
import affilate.vo.AffilateStar;
import common.JDBCTemplate;


public class AffilateService {

	public AffilateList selectAffilate(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 10;
		int totalCount = new AffilateDao().totalCount(conn);
		int totalPage =0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		System.out.println(totalPage);
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		ArrayList<Affilate> list = new AffilateDao().selectAffilate(conn,start,end);
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
		ArrayList<AffilateStar> reviewStar = new AffilateDao().selectSolonRevuew(conn);
		
		AffilateList pd = new AffilateList(list,pageNavi,reviewStar);
		JDBCTemplate.close(conn);
		return pd;
	}

	public AffilateList selectAffilate(String sq) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Affilate> list = new AffilateDao().selectSolonRevuew(conn,sq);
		ArrayList<AffilateStar> reviewStar = new AffilateDao().selectAffilate(conn,sq);
		AffilateList pd = new AffilateList(list,null,reviewStar);
		JDBCTemplate.close(conn);
		return pd;
	}

}
