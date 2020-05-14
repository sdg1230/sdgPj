package salon.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import salon.dao.SalonDao;
import salon.vo.Salon;

public class SalonService {

	public ArrayList<Salon> selectSalon() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Salon> slist = new SalonDao().selectSalon(conn);
		JDBCTemplate.close(conn);
		return slist;
	}

}
