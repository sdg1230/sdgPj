package question.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import question.model.service.QuestionService;
import question.model.vo.Question;

/**
 * Servlet implementation class InsertAnswerServlet
 */
@WebServlet(name = "InsertAnswer", urlPatterns = { "/insertAnswer" })
public class InsertAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAnswerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = request.getSession().getServletContext().getRealPath("/");
		String saveDirectory = root+"ckstorage/question";
		//파일 최대 크기 설정
		int maxSize = 10*1024*1024;
		// request -> MultipartRequest 파일 업로드 진행
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		Question q = new Question();
		String questionContent = (mRequest.getParameter("questionContent1"));
		String questionFilename = mRequest.getOriginalFileName("questionFilename1");
		String questionFilepath = (mRequest.getFilesystemName("questionFilename1"));
		int questionRef = Integer.parseInt(mRequest.getParameter("questionRef1"));
		String questionWriter = (mRequest.getParameter("questionWriter1"));
		q.setQuestionContent(questionContent);
		q.setQuestionFilename(questionFilename);
		q.setQuestionFilepath(questionFilepath);
		q.setQuestionRef(questionRef);
		q.setQuestionWriter(questionWriter);
		int result = new QuestionService().insertAnswer(q);
		if(result>0) {
			request.setAttribute("msg", "답변등록 성공");
			request.setAttribute("loc", "/questionAnswer");
		}else {
			request.setAttribute("msg", "답변 등록 실패");
			request.setAttribute("loc", "/questionList");
		}
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
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
