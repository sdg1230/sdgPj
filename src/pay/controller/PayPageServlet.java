package pay.controller;

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
		int reserveNo = Integer.parseInt(request.getParameter("reserveNo"));
		
		ArrayList<String> reserveDetail = new ReserveService().selectDetailList(reserveNo);
		StringBuilder sb = new StringBuilder();
		for(int i=0; i<reserveDetail.size();i++) {
			sb.append(reserveDetail.get(i)+",");
		}
		sb.deleteCharAt(sb.length()-1);

		Reserve r = new ReserveService().selectOneReserve(reserveNo);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/pay/payPage.jsp");
		request.setAttribute("r", r);
		request.setAttribute("detail", sb);
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
