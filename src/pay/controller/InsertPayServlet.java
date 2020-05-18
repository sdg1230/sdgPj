package pay.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pay.model.service.PayService;
import pay.model.vo.Pay;

/**
 * Servlet implementation class InsertPayServlet
 */
@WebServlet(name = "InsertPay", urlPatterns = { "/insertPay" })
public class InsertPayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		int reserveNo = Integer.parseInt(request.getParameter("reserveNo"));
		int paymentPrice = Integer.parseInt(request.getParameter("paymentPrice"));
		String paymentId = request.getParameter("paymentId");
		String paymentNo = request.getParameter("paymentNo");
		System.out.println(memberId+"/"+reserveNo+"/"+paymentPrice+"/"+paymentId+"/"+paymentNo);
		Pay p = new Pay();
		p.setMemberId(memberId);
		p.setReserveNo(reserveNo);
		p.setPaymentPrice(paymentPrice);
		p.setPaymentNo(paymentNo);
		p.setPaymentId(paymentId);
		
		int result = new PayService().insertPayment(p);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		request.setAttribute("loc", "/");
		if(result==2) {
			request.setAttribute("msg", "결제가 완료되었습니다.");
		}else {
			request.setAttribute("msg", "결제진행에 문제가 있습니다.");
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
