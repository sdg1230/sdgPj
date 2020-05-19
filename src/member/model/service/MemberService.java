package member.model.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.JDBCTemplate;
import member.model.dao.MemberDao;
import member.model.vo.Member;

public class MemberService {

	public Member selectOneMember(String memberId, String memberPw) {
		Connection conn =JDBCTemplate.getConnection();
		Member m=new MemberDao().selectOneMember(conn,memberId,memberPw);
		JDBCTemplate.close(conn);
		return m;
	}

	public Member selectOneMember(String memberId) {
		Connection conn=JDBCTemplate.getConnection();
		Member member=new MemberDao().selectOneMember(conn,memberId);
		JDBCTemplate.close(conn);
		return member;
	}

	public int insertMember(Member m) {
		Connection conn=JDBCTemplate.getConnection();
		int result=new MemberDao().insertMember(conn,m);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}

	public int selectOneMembers(String memberId) {
		Connection conn=JDBCTemplate.getConnection();
		int member=new MemberDao().selectOneMembers(conn,memberId);
		
		
		JDBCTemplate.close(conn);
		return member;
	}

	public int update(Member m) {
		Connection conn=JDBCTemplate.getConnection();
		int result = new MemberDao().update(conn,m);
		JDBCTemplate.close(conn);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}

	public int deleteMember(String memberId) {
		Connection conn=JDBCTemplate.getConnection();
		int result=new MemberDao().deleteMember(conn,memberId);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}

	public ArrayList<Member> selectAllMember() {
		Connection conn=JDBCTemplate.getConnection();
		ArrayList<Member> list= new MemberDao().selectAllMember(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public Member idSearch(String memberName, String memberPhone) {
		Connection conn=JDBCTemplate.getConnection();
		Member m=new MemberDao().idSearch(conn,memberName,memberPhone);
		JDBCTemplate.close(conn);
		return m;
		
	}

	public int pwSearch(String memberId, String memberPhone) {
		Connection conn=JDBCTemplate.getConnection();
		int m= new MemberDao().pwSearch(conn,memberId,memberPhone);
		JDBCTemplate.close(conn);
		
		return m;
	}

	

	

}
