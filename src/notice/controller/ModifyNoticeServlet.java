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
 * Servlet implementation class ModifyNoticeServlet
 */
@WebServlet(name = "ModifyNotice", urlPatterns = { "/modifyNotice" })
public class ModifyNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		
		Notice n = new Notice();
		n.setNoticeContent(request.getParameter("noticeContent"));
		n.setNoticeTitle(request.getParameter("noticeTitle"));
		int result = new NoticeService().modifyNotice(noticeNo,n);
		if(result>0) {
			request.setAttribute("msg", "공지사항 수정 완료");
			request.setAttribute("loc", "/noticeDetail?noticeNo="+noticeNo);
		}else {
			request.setAttribute("msg", "공지사항 수정 실패");
			request.setAttribute("loc", "/noticeList?reqPage=1");
		}
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
