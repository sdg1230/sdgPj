package member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.swing.plaf.synth.SynthSpinnerUI;

import common.JDBCTemplate;
import member.model.vo.Member;

public class MemberDao {

	public Member selectOneMember(Connection conn, String memberId, String memberPw) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		Member m=null;
		String query="select * from member where member_id=? and member_pw=? ";
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPw);
			rset=pstmt.executeQuery();
			if(rset.next()) {
				m=new Member();
				m.setMemberId(rset.getString("member_id"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setMemberName(rset.getString("member_name"));
				m.setMemberPhone(rset.getString("member_phone"));
				m.setGender(rset.getString("gender"));
				m.setAge(rset.getInt("age"));
				m.setAddress(rset.getString("address"));
				m.setEnrollDate(rset.getDate("enroll_date"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return m;
	}

	public Member selectOneMember(Connection conn, String memberId) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		Member member=null;
		String query="select * from member where member_id=?";
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset=pstmt.executeQuery();
			if(rset.next()) {
				member=new Member();
				member.setMemberId(rset.getString("member_id"));
				member.setMemberPw(rset.getString("member_pw"));
				member.setMemberName(rset.getString("member_name"));
				member.setMemberPhone(rset.getString("member_phone"));
				member.setGender(rset.getString("gender"));
				member.setAge(rset.getInt("age"));
				member.setAddress(rset.getString("address"));
				member.setEnrollDate(rset.getDate("enroll_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return member;
	}

	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		String query="insert into member values(?,?,?,?,?,?,?,sysdate)";
		try {
			pstmt=conn.prepareStatement(query);
			
			pstmt.setString(1,m.getMemberId());
			pstmt.setString(2,m.getMemberPw());
			pstmt.setString(3,m.getMemberName());
			pstmt.setString(4,m.getMemberPhone());
			pstmt.setString(5,m.getGender());
			pstmt.setInt(6,m.getAge());
			pstmt.setString(7, m.getAddress());;
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
	}

	public int selectOneMembers(Connection conn, String memberId) {
		PreparedStatement pstmt=null;
		int m =0;
		String query="select * from member where member_id=?";
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			m = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			JDBCTemplate.close(pstmt);
		}
		return m;
	}

	public int update(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result =0;
		String query="update member set member_pw=?,member_name=?,member_phone=?,gender=?,age=?,address=? where member_id=?";
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, m.getMemberPw());
			pstmt.setString(2, m.getMemberName());
			pstmt.setString(3, m.getMemberPhone());
			pstmt.setString(4, m.getGender());
			pstmt.setInt(5, m.getAge());
			pstmt.setString(6, m.getAddress());
			pstmt.setString(7, m.getMemberId());
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int deleteMember(Connection conn, String memberId) {
		PreparedStatement pstmt=null;
		int result=0;
		String query="delete from member where member_id=?";
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(conn);
		}
		
		return result;
	}

	public ArrayList<Member> selectAllMember(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		Member m=null;
		String query="select * from member";
		ArrayList<Member> list=new ArrayList<Member>();
		try {
			
			pstmt=conn.prepareStatement(query);
			rset=pstmt.executeQuery();
			while(rset.next()) {
				m=new Member();
				m.setMemberId(rset.getString("member_id"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setMemberName(rset.getString("member_name"));
				m.setMemberPhone(rset.getString("member_phone"));
				m.setGender(rset.getString("gender"));
				m.setAge(rset.getInt("age"));
				m.setAddress(rset.getString("address"));
				m.setEnrollDate(rset.getDate("enroll_date"));
				list.add(m);
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

	public Member idSearch(Connection conn, String memberName, String memberPhone) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		Member m=null;
		String query="select member_id from  member where member_name=? and member_phone=?";
		
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1,memberName);
			pstmt.setString(2, memberPhone);
			rset=pstmt.executeQuery();
			if(rset.next()) {
				m=new Member();
				m.setMemberId(rset.getString("member_id"));
				System.out.println(m.getMemberId());
			}	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
			
		}
		
		return m;
	}

	public int pwSearch(Connection conn, String memberId, String memberPhone) {
		PreparedStatement pstmt=null;
		int m=0;
		
		String query="select member_pw from  member where member_id=? and member_phone=?";
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setString(2,memberPhone);
			
			m=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			JDBCTemplate.close(pstmt);
		}
		
		return m;
	}

	
}
