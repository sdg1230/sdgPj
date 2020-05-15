package reserve.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import reserve.service.ReserveService;
import reserve.vo.Reserve;

/**
 * Servlet implementation class InsertReserveServlet
 */
@WebServlet(name = "InsertReserve", urlPatterns = { "/insertReserve" })
public class InsertReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReserveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		String reserveDate = request.getParameter("reserveDate");
		String salonName = request.getParameter("salonName");
		int designerNo = Integer.parseInt(request.getParameter("designerNo"));
		String[] hairNo = request.getParameterValues("hairNo");
		int startTime = Integer.parseInt(request.getParameter("startTime"));
		int reserveTime = Integer.parseInt(request.getParameter("reserveTime"));
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		
		Reserve r = new Reserve();
		r.setMemberId(memberId);
		r.setReserveDate(reserveDate);
		r.setSalonName(salonName);
		r.setDesignerNo(designerNo);
		r.setStartTime(startTime);
		r.setReserveTime(reserveTime);
		r.setTotalPrice(totalPrice);
		
		int result = new ReserveService().insertReserve(r,hairNo);		
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/reserve/succeccReserve.jsp");
		if(result==hairNo.length+1) {
			request.setAttribute("msg", "예약완료");
		}else {
			request.setAttribute("msg", "예약실패");
		}
		request.setAttribute("reserveInfo1", r);
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
