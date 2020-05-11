package affilate.service;

import java.sql.Connection;
import java.util.ArrayList;

import affilate.dao.AffilateDao;
import affilate.vo.Affilate;
import common.JDBCTemplate;

public class AffilateService {

	public ArrayList<Affilate> selectAffilate() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Affilate> list = new AffilateDao().selectAffilate(conn);
		JDBCTemplate.close(conn);
		return list;
	}

}
