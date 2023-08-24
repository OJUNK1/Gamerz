package co.yedam.gamerz.review.web;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.gamerz.common.ViewResolve;
import co.yedam.gamerz.review.service.ReviewService;
import co.yedam.gamerz.review.service.ReviewVO;
import co.yedam.gamerz.review.serviceImpl.ReviewServiceImpl;

@WebServlet("/reviewedit.do")
public class ReviewEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReviewEdit() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ReviewService dao = new ReviewServiceImpl();
		ReviewVO vo = new ReviewVO();

		vo.setReviewDate(LocalDate.parse(request.getParameter("reviewDate")));
		vo.setReviewComment(request.getParameter("reviewComment"));
		vo.setReviewId(Integer.parseInt("reviewId"));
		
		int n = dao.reviewUpdate(vo);
		String viewName = "game/gameinfo";

		if (n == 1) {
			vo = dao.reviewSelect(vo);
			request.setAttribute("re", vo);
			ViewResolve.forward(request, response, viewName);
			response.getWriter().write("Success");
		} else {
			response.getWriter().write("Failure");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
