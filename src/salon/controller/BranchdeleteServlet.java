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
import salon.vo.SalonList;

/**
 * Servlet implementation class BranchdeleteServlet
 */
@WebServlet(name = "Branchdelete", urlPatterns = { "/branchdelete" })
public class BranchdeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BranchdeleteServlet() {
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
		Salon aff = new Salon();
		String dd = mRequest.getParameter("dp");
		System.out.println(dd);
		
			
			aff.setSalonName(mRequest.getParameter("salonName"));
			
			System.out.println(aff.getSalonName()+"ddddd아아");
			SalonList af = new	SalonService().selectdelete(aff.getSalonName());
			
			
			String oldFilepath = mRequest.getParameter("oldFilepath");
			String oldFilename = mRequest.getParameter("oldFilename");
			//기존 파일값을 유지하기 위한 설정
			
			
			//3.비지니스로직
			
			//4.결과 처리
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			if(af!=null) {
				File delFile = new File(saveDirectory+"/"+oldFilepath);
				System.out.println(delFile);
				delFile.delete();
				request.setAttribute("msg", "삭제 성공!");
				
			}else {
				request.setAttribute("msg", "삭제 실패!");
			}
			request.setAttribute("loc", "/branchmanagement?reqPage=1");
			request.setAttribute("list", af.getAffilateList());
			request.setAttribute("pageNavi", af.getPageNavi());
			
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
