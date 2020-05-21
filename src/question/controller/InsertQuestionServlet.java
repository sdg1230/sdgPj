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
 * Servlet implementation class InsertQuestionServlet
 */
@WebServlet(name = "InsertQuestion", urlPatterns = { "/insertQuestion" })
public class InsertQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertQuestionServlet() {
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
		String questionContent = (mRequest.getParameter("questionContent"));
		String questionFilename = mRequest.getOriginalFileName("questionFilename");
		String questionFilepath = (mRequest.getFilesystemName("questionFilename"));
		int questionRef = Integer.parseInt(mRequest.getParameter("questionRef"));
		String questionWriter = (mRequest.getParameter("questionWriter"));
		q.setQuestionContent(questionContent);
		q.setQuestionFilename(questionFilename);
		q.setQuestionFilepath(questionFilepath);
		q.setQuestionRef(questionRef);
		q.setQuestionWriter(questionWriter);
		int result = new QuestionService().insertQuestion(q);
		if(result>0) {
			request.setAttribute("msg", "관리자의 답변을 기다려 주세요.");
			request.setAttribute("loc", "/questionList?questionWriter="+q.getQuestionWriter());
		}else {
			request.setAttribute("msg", "문의 등록 실패. 내용을 입력하세요.");
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
