package designer.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import designer.model.service.DesignerService;
import designer.model.vo.Designer;
import designer.model.vo.DesignerListData;

/**
 * Servlet implementation class DesignerListServlet
 */
@WebServlet(name = "DesignerList", urlPatterns = { "/designerList" })
public class DesignerListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DesignerListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DesignerListData dld = new DesignerService().selectAllDesigner();
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/designer/designerList.jsp");
		request.setAttribute("totalCount", dld.getDesignerList().size());
		request.setAttribute("salonList", dld.getSalonList());
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
