package reserve.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import review.Service.ReviewService;
import salonReview.vo.SalonReview;

/**
 * Servlet implementation class InsertReviewServlet
 */
@WebServlet(name = "InsertReview", urlPatterns = { "/insertReview" })
public class InsertReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String text = request.getParameter("insertReview");
		int star = Integer.parseInt(request.getParameter("selected_rating"));
		int reserveNo = Integer.parseInt(request.getParameter("reserveNo"));
		String memberId = request.getParameter("memberId");
		String salonName = request.getParameter("salonName");
		
		String reserveReview = "true";
		
		int number = Integer.parseInt(request.getParameter("number"));
		//		HttpSession session = request.getSession(false);
//		int reserveNo = Integer.parseInt(request.getParameter("reserveNo"));
	
		
		SalonReview s = new SalonReview();
		s.setReserveNo(reserveNo);
		s.setReviewComment(text);
		s.setReviewStar(star);
		s.setReviewWriter(memberId);
		s.setSalonName(salonName);
		
//		int reserveNo = 25;
		System.out.println("예약번호 : "+reserveNo);
		System.out.println("한줄평 입력한 값 : "+text);
		System.out.println("별점 먹인 수 : "+star);
		
		System.out.println("지점 이름 : "+salonName);
		System.out.println("유저 id : "+memberId);
		
		
		System.out.println("리뷰작성여부 : 1or0"+number);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		int result = new ReviewService().insertReview(s,reserveReview);
		System.out.println("result값 확인 : "+result);
		
		if(result>0) {
			
			
			request.setAttribute("msg", "리뷰작성 성공");
			request.setAttribute("loc", "/reserveListFrm?memberId="+memberId);
			System.out.println("예약확인 여부 업데이트 / 리뷰작성 성공");			
		}else {
			
			
			request.setAttribute("msg", "리뷰작성 실패");
			System.out.println("예약확인 여부 업데이트 / 리뷰작성 실패");
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
