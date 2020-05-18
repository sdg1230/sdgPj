package question.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import question.model.vo.Question;

public class QuestionDao {

	public ArrayList<Question> printQuestion(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from question";
		ArrayList<Question> list = new ArrayList<Question>();
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Question q = new Question();
				q.setQuestionContent(rset.getString("question_content"));
				q.setQuestionFilename(rset.getString("question_filename"));
				q.setQuestionFilepath(rset.getString("question_filepath"));
				q.setQuestionNo(rset.getInt("question_no"));
				q.setQuestionRef(rset.getInt("question_ref"));
				q.setQuestionWriter(rset.getString("question_writer"));
				list.add(q);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public ArrayList<Question> myQuestion(Connection conn, String questionWriter) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from question where question_writer=? or question_writer='admin' order by question_date asc";
		ArrayList<Question> list = new ArrayList<Question>();
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, questionWriter);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Question q = new Question();
				q.setQuestionContent(rset.getString("question_content"));
				q.setQuestionFilename(rset.getString("question_filename"));
				q.setQuestionFilepath(rset.getString("question_filepath"));
				q.setQuestionNo(rset.getInt("question_no"));
				q.setQuestionRef(rset.getInt("question_ref"));
				q.setQuestionWriter(rset.getString("question_writer"));
				list.add(q);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

}
