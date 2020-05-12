package reserve.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reserve.service.ReserveService;
import reserve.vo.Reserve;
import reserve.vo.ReserveDetail;

/**
 * Servlet implementation class ReserveListServlet
 */
@WebServlet(name = "ReserveList", urlPatterns = { "/adminReserveList" })
public class AdminReserveListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReserveListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//String memberId = request.getSession().getAttribute("member").getMemberId();
		String memberId = "admin";
		if(memberId.equals("admin")) {
			ArrayList<Reserve> list = new ReserveService().selectAllReserve();
			ArrayList<ReserveDetail> dlist = new ReserveService().selectAllReserveDetail();
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/reserve/adminReserveList.jsp");
			request.setAttribute("list", list);
			request.setAttribute("dlist", dlist);
			rd.forward(request, response);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "관리자가 아닙니다");
			request.setAttribute("loc", "/");
			rd.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
