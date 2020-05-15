package notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeDetailServlet
 */
@WebServlet(name = "NoticeDetail", urlPatterns = { "/noticeDetail" })
public class NoticeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//2. 변수에 값저장
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		Notice n = new Notice();
		n = new NoticeService().noticeDetail(noticeNo);
		//3. 비지니스로직 처리
		if(n == null) {
			request.setAttribute("msg", "조회된 결과가 없습니다");
			request.setAttribute("loc", "/noticeList?reqPage=1");
		}else {
			request.setAttribute("n", n);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/notice/noticeDetail.jsp");
			rd.forward(request, response);
			
		}
		//4. 결과처리
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
