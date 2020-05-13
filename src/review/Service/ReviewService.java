package review.Service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import salonReview.dao.SalonReviewDao;
import salonReview.vo.SalonReview;

public class ReviewService {

	public int insertReview(SalonReview s,String reserveStatus) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new SalonReviewDao().insertReview(conn,s);
		int result2 = new SalonReviewDao().updateReview(conn,reserveStatus,s);
		
		if(result>0&&result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

}
