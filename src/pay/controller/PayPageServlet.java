package pay.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reserve.service.ReserveService;
import reserve.vo.Reserve;

/**
 * Servlet implementation class PayPageServlet
 */
@WebServlet(name = "PayPage", urlPatterns = { "/payPage" })
public class PayPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		////String reserveNo = request.getParameter("reserveNo");
		//Reserve r = new ReserveService();
		//예약정보 하나 가져오는거 만들어도되는지 혹시만들었는지
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/pay/payPage.jsp");
		//request.setAttribute("r", r);
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
