package co.yedam.gamerz.review.web;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.gamerz.common.ViewResolve;
import co.yedam.gamerz.review.service.ReviewService;
import co.yedam.gamerz.review.service.ReviewVO;
import co.yedam.gamerz.review.serviceImpl.ReviewServiceImpl;

@WebServlet("/reviewinsert.do")
public class ReviewInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReviewInsert() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ReviewService dao = new ReviewServiceImpl();
		ReviewVO vo = new ReviewVO();
		
		vo.setReviewLocation(request.getParameter("reviewLocation"));				
		vo.setReviewWriter(request.getParameter("reviewWriter"));
		vo.setReviewComment(request.getParameter("reviewComment"));
		
		int num = dao.reviewInsert(vo);

		if (num == 1) {
			request.setAttribute("reviewPage", request.getParameter("reviewPage"));
			request.setAttribute("reviewPageId", request.getParameter("reviewPageId"));
			request.setAttribute("message", "리뷰 등록 성공");
		} else {
			request.setAttribute("message", "리뷰 등록 실패");
		}

		String viewName = "review/reviewmessage";
		ViewResolve.forward(request, response, viewName);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
