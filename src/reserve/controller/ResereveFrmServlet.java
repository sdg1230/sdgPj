package reserve.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import designer.model.service.DesignerService;
import designer.model.vo.Designer;
import designer.model.vo.DesignerListData;
import reserve.service.ReserveService;
import reserve.vo.HairMenu;
import salon.service.SalonService;
import salon.vo.Salon;

/**
 * Servlet implementation class ResereveFrmServlet
 */
@WebServlet(name = "ResereveFrm", urlPatterns = { "/reserveFrm" })
public class ResereveFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResereveFrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Designer> dlist = new DesignerService().selectAllDesigner().getDesignerList();
		ArrayList<Salon> slist = new SalonService().selectSalon();
		ArrayList<HairMenu> hlist = new ReserveService().selectHairMenu();
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/reserve/reserveFrm.jsp");
		request.setAttribute("dlist", dlist);
		request.setAttribute("slist", slist);
		request.setAttribute("hlist", hlist);
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
