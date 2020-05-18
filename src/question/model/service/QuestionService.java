package question.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import question.model.dao.QuestionDao;
import question.model.vo.Question;

public class QuestionService {

	public ArrayList<Question> printQuestion() {
		Connection conn =  JDBCTemplate.getConnection();
		ArrayList<Question> list = new QuestionDao().printQuestion(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<Question> myQuestion(String questionWriter) {
		Connection conn =  JDBCTemplate.getConnection();
		ArrayList<Question> list = new QuestionDao().myQuestion(conn,questionWriter);
		JDBCTemplate.close(conn);
		return list;
	}

}
