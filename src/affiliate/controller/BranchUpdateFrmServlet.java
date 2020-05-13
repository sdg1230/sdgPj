package affiliate.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import affilate.service.AffilateService;
import affilate.vo.Affilate;

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
		Affilate aff = new AffilateService().salonUpdateFrm(salonName);
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
