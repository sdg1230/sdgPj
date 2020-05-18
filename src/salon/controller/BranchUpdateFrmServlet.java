package salon.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import salon.service.SalonService;
import salon.vo.Salon;

/**
 * Servlet implementation class BranchUpdateFrmServlet
 */
@WebServlet(name = "BranchUpdateFrm", urlPatterns = { "/branchUpdateFrm" })
public class BranchUpdateFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BranchUpdateFrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String salonName = request.getParameter("salonName");
		System.out.println(salonName);
		Salon aff = new SalonService().salonUpdateFrm(salonName);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/company/branchupdate.jsp");
		System.out.println(aff.getSalonFilename()+"ddd");
		request.setAttribute("list", aff);
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
