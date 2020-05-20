package reserve.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reserve.service.ReserveService;

/**
 * Servlet implementation class ReserveDelete1Servlet
 */
@WebServlet(name = "ReserveDelete1", urlPatterns = { "/reserveDelete1" })
public class ReserveDelete1Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserveDelete1Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reserveNo = Integer.parseInt(request.getParameter("reserveNo"));
		//System.out.println("확인확인확인확인확인 : "+reserveNo);
		int result = new ReserveService().DeleteReserve1(reserveNo);
		
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/common/msg.jsp");
		if(result>0) {
			
			request.setAttribute("msg", "예약취소 성공");
			request.setAttribute("loc", "/reserveListFrm");
		}else {
			request.setAttribute("msg", "예약취소 실패");
			request.setAttribute("loc", "/reserveListFrm");
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
