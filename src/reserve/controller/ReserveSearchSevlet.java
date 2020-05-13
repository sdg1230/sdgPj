package reserve.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import reserve.service.ReserveService;
import reserve.vo.Reserve;

/**
 * Servlet implementation class ReserveSearchSevlet
 */
@WebServlet(name = "ReserveSearch", urlPatterns = { "/reserveSearch" })
public class ReserveSearchSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserveSearchSevlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int reserveNo = Integer.parseInt(request.getParameter("reserveNo"));
		System.out.println(reserveNo);
		ArrayList<Reserve> list = new ReserveService().searchReserve(reserveNo);
		
//		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/reserve/reserveList.jsp");
		if(!list.isEmpty()) {
			System.out.println("여기확인");
			request.setAttribute("searchReserveList", list);
		}
		
		System.out.println(list.get(0));
		System.out.println("크기:" +list.size());
		System.out.println("성공했어");
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(list,response.getWriter());
//		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
