package member.model.vo;

import java.sql.Date;

public class Member {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberPhone;
	private String gender;
	private int age;
	private String address;
	private Date enrollDate;
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(String memberId, String memberPw, String memberName, String memberPhone, String gender, int age,
			String address, Date enrollDate) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.gender = gender;
		this.age = age;
		this.address = address;
		this.enrollDate = enrollDate;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	
}
