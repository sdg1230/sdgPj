package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class JoinServlet
 */
@WebServlet(name = "Join", urlPatterns = { "/join" })
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Member m=new Member();
		m.setMemberId(request.getParameter("memberId"));
		m.setMemberName(request.getParameter("memberName"));
		m.setMemberPw(request.getParameter("memberPw"));
		m.setMemberPhone(request.getParameter("phone"));
		m.setGender(request.getParameter("gender"));
		//System.out.println(m.getGender());
		m.setAge(Integer.parseInt(request.getParameter("age")));
		//System.out.println(m.getAge());
		m.setAddress(request.getParameter("address"));
		//System.out.println(m.getAddress());
		
		int result=new MemberService().insertMember(m);
		RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		
		if(result>0) { //회원가입성공시
			
			request.setAttribute("msg", "회원가입성공");
			request.setAttribute("loc","/joinComplete");
			
		}else {
			request.setAttribute("msg", "회원가입실패");
			request.setAttribute("loc", "/joinFrm");
		}
		rd.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
