package designer.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import designer.model.service.DesignerService;
import designer.model.vo.Designer;

/**
 * Servlet implementation class UpdateDesignerServlet
 */
@WebServlet(name = "UpdateDesigner", urlPatterns = { "/updateDesigner" })
public class UpdateDesignerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDesignerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "[enctype]확인");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("WEB-INF/views/common/msg.jsp").forward(request, response);
			return;
		}
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root + "upload/designer";
		int maxSize = 10 * 1024 * 1024;
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());
		Designer d = new Designer();
		d.setDesignerNo(Integer.parseInt(mRequest.getParameter("designerNo")));
		d.setDesignerName(mRequest.getParameter("designerName"));
		d.setSalonName(mRequest.getParameter("salonName"));
		d.setDesignerInfo(mRequest.getParameter("designerInfo"));
		d.setDesignerFilename(mRequest.getOriginalFileName("designerFilename"));
		d.setDesignerFilepath(mRequest.getFilesystemName("designerFilename"));
		
		String status = mRequest.getParameter("status");
		String oldFilepath = mRequest.getParameter("oldFilepath");
		String oldFilename = mRequest.getParameter("oldFilename");
		if (status.equals("stay")) {
			d.setDesignerFilename(oldFilename);
			d.setDesignerFilepath(oldFilepath);		
		}
		
		int result = new DesignerService().updateDesigner(d);
		if(result>0) {
			if(status.equals("delete")) {
				File delFile = new File(saveDirectory + "/" + oldFilepath);
				delFile.delete();
			}
			request.setAttribute("msg", "수정성공!");
		}else {
			request.setAttribute("msg", "수정실패!");
		}
		request.setAttribute("loc", "/designerList");
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
