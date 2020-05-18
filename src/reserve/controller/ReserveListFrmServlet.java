package reserve.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import reserve.service.ReserveService;
import reserve.vo.Reserve;

/**
 * Servlet implementation class ReserveListFrmServlet
 */
@WebServlet(name = "ReserveListFrm", urlPatterns = { "/reserveListFrm" })
public class ReserveListFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserveListFrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);
		Member m = (Member) session.getAttribute("member");
		String memberId = m.getMemberId();
		
		ArrayList<Reserve>list = new ReserveService().reserveList(memberId);
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/reserve/reserveList.jsp");
		
		if(!list.isEmpty()) {
			
			request.setAttribute("userReserveList", list);
			
		}
		System.out.println(list.get(0));
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
