package review.Service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import salonReview.dao.SalonReviewDao;
import salonReview.vo.SalonReview;

public class ReviewService {

	public int insertReview(SalonReview s,String reserveStatus,String reserveReview) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new SalonReviewDao().insertReview(conn,s);
		int result2 = new SalonReviewDao().updateReview(conn,reserveStatus,s);
		int result3 = new SalonReviewDao().updateReserveReview(conn,reserveReview,s);
		if(result>0&&result2>0&&result3>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

}
