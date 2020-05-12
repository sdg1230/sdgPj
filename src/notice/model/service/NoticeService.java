package notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;
import notice.model.vo.NoticePageData;

public class NoticeService {

	public NoticePageData selectList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 5;// 한 페이지 당 게시물 수
		// 총 게시물 수를 구해오는 dao 호출
		int totalCount = new NoticeDao().totalCount(conn);
		int totalPage = 0;
		// 총 페이지 수를 연산
		if(totalCount%numPerPage==0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage +1;
		}
		// 조회해 올 게시물 시작번호와 끝번호 연산
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		// 해당 페이지의 게시물들 조회
		ArrayList<Notice> list = new NoticeDao().selectList(conn,start,end);
		// 페이지 내비게이션 작성 시작
		String pageNavi = "";
		// 페이지 내비게이션 길이
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo != 1) {
			pageNavi += "<a class='noticePrevBtn' href='/noticeList?reqPage="+(pageNo-pageNaviSize)+"'>이전</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='selectNoticePage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='noticeBtn' href='/noticeList?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo<=totalPage) {
			pageNavi += "<a class='noticeNextBtn' href='/noticeList?reqPage="+pageNo+"'>다음</a>";
		}
		NoticePageData pd = new NoticePageData(list,pageNavi);
		JDBCTemplate.close(conn);
		return pd;
	}

	public ArrayList<Notice> searchTitle(String searchTitle) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Notice> list = new NoticeDao().searchTitle(conn,searchTitle);
		
		
		JDBCTemplate.close(conn);
		return list;
	}

}
