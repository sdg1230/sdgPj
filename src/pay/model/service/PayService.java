package pay.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import pay.model.dao.PayDao;
import pay.model.vo.Pay;

public class PayService {

	public int insertPayment(Pay p) {
		Connection conn = JDBCTemplate.getConnection();
		int result1 = new PayDao().insertPayment(conn, p);
		int result2 = new PayDao().updateStatus(conn, p.getReserveNo());
		if(result1+result2==2) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result1+result2;
	}

}
