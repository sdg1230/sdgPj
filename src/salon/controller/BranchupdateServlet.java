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
 * Servlet implementation class BranchupdateServlet
 */
@WebServlet(name = "Branchupdate", urlPatterns = { "/branchupdate" })
public class BranchupdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BranchupdateServlet() {
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
		//2.변수값 저장
		//파일 저장 준비
		//1)업로드 경로
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root+"/upload/salon";
		//2)파일크기 지정
		int maxSize = 10*1024*1024;
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		Salon aff = new Salon();
		aff.setSalonAddr(mRequest.getParameter("salonAddr"));
		aff.setSalonFilename(mRequest.getOriginalFileName("salonFilename"));
		aff.setSalonFilepath(mRequest.getFilesystemName("salonFilename"));
		aff.setSalonInfo(mRequest.getParameter("salonInfo"));
		aff.setSalonName(mRequest.getParameter("salonName"));
		aff.setSalonPhone(mRequest.getParameter("salonPhone"));
		aff.setSalonNo(Integer.parseInt(mRequest.getParameter("salonNo")));
		String status=mRequest.getParameter("status");
		
		String oldFilepath = mRequest.getParameter("oldFilepath");
		String oldFilename = mRequest.getParameter("oldFilename");
		//기존 파일값을 유지하기 위한 설정
		System.out.println(oldFilename);
		if(aff.getSalonFilename() == null) {
			if(status.equals("stay")) {
				aff.setSalonFilename(oldFilename);
				aff.setSalonFilepath(oldFilepath);
			}
		}
		//3.비지니스로직
		int result = new SalonService().salonUpdate(aff);
		//4.결과 처리
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			
			if(status.equals("delete")) {
				
				File delFile = new File(saveDirectory+"/"+oldFilepath);
				System.out.println(delFile);
				delFile.delete();
			}
			request.setAttribute("msg", "수정 성공!");
			
		}else {
			request.setAttribute("msg", "수정 실패!");
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
