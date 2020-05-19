package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class AdminDeleteMembeServlet
 */
@WebServlet(name = "AdminDeleteMembe", urlPatterns = { "/adminDeleteMembe" })
public class AdminDeleteMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDeleteMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		
	      //3.비지니스 로직
	      int result = new MemberService().deleteMember(memberId);
	      
	      //4.결과 처리
	      RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
	      if(result>0) {
	         request.setAttribute("msg", "회원탈퇴 성공");
	         request.setAttribute("loc", "/adminPage");
	      }else {
	         request.setAttribute("msg", "회원탈퇴 실패");
	         request.setAttribute("loc", "/adminPage");
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
