package salon.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import salon.service.SalonService;
import salon.vo.Salon;

/**
 * Servlet implementation class BranchregistrationServlet
 */
@WebServlet(name = "Branchregistration", urlPatterns = { "/branchregistration" })
public class BranchregistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BranchregistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "[enctype]확인");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root+"/upload/salon";
		
		int maxSize = 10*1024*1024;
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		String roadAddr = mRequest.getParameter("roadAddr");
		String jibunAddr = mRequest.getParameter("jibunAddr");
		String detailAddr = mRequest.getParameter("detailAddr");
		System.out.println(roadAddr);
		System.out.println(jibunAddr);
		System.out.println(detailAddr);
		Salon aff = new Salon();
		aff.setSalonAddr(roadAddr+jibunAddr+detailAddr);
		System.out.println(aff.getSalonAddr());
		aff.setSalonFilename(mRequest.getOriginalFileName("salonFilename"));
		aff.setSalonFilepath(mRequest.getFilesystemName("salonFilename"));
		aff.setSalonInfo(mRequest.getParameter("salonInfo"));
		aff.setSalonName(mRequest.getParameter("salonName"));
		aff.setSalonPhone(mRequest.getParameter("salonPhone"));
		
		int result = new SalonService().insertAffilatr(aff);
		//4.결과 처리
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			
			request.setAttribute("msg", "등록 성공!");
			
		}else {
			request.setAttribute("msg", "등록 실패!");
		}
		request.setAttribute("loc", "/branchmanagement?reqPage=1");
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
