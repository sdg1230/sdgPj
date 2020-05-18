package salon.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;
import salon.service.SalonService;
import salon.vo.Salon;
import salon.vo.SalonList;

/**
 * Servlet implementation class AffilateoneServlet
 */
@WebServlet(name = "SalononeServlet", urlPatterns = { "/salononeServlet" })
public class SalononeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalononeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String sq = request.getParameter("search1");
		String type = request.getParameter("type");
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/company/branchList.jsp");
		if(type.equals("salonName2")) {
			ArrayList<Salon> list = new SalonService().selectAffilate(sq);
			request.setAttribute("list", list);
		}else {
			ArrayList<Salon> list = new SalonService().selectAffilateAddr(sq);
			request.setAttribute("list", list);
		}
		request.setAttribute("type", type);
		request.setAttribute("key", sq);
		
		System.out.println(type);
		
		
		
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
