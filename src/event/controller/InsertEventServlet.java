package event.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import event.model.service.EventService;
import event.model.vo.Event;

/**
 * Servlet implementation class InsertEventServlet
 */
@WebServlet(name = "InsertEvent", urlPatterns = { "/insertEvent" })
public class InsertEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertEventServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String root = request.getSession().getServletContext().getRealPath("/");
		String saveDirectory = root+"ckstorage/photo";
		//파일 최대 크기 설정
		int maxSize = 10*1024*1024;
		// request -> MultipartRequest 파일 업로드 진행
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		String eventTitle = mRequest.getParameter("eventTitle");
		String eventContent = mRequest.getParameter("eventContent");
		String eventFilename = mRequest.getOriginalFileName("eventFilename");
		String eventFilepath = mRequest.getFilesystemName("eventFilename");
		
		Event e = new Event();
		
		e.setEventTitle(eventTitle);
		e.setEventContent(eventContent);
		e.setEventFilename(eventFilename);
		e.setEventFilepath(eventFilepath);
		
		
		int result = new EventService().insertEvent(e);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		request.setAttribute("loc", "/eventList");
		if(result>0) {
			request.setAttribute("msg", "등록 성공");
		}else {
			request.setAttribute("msg", "등록 실패");
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
