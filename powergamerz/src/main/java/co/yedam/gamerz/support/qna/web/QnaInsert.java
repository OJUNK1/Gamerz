package co.yedam.gamerz.support.qna.web;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.gamerz.common.ViewResolve;
import co.yedam.gamerz.support.qna.service.QnaService;
import co.yedam.gamerz.support.qna.service.QnaVO;
import co.yedam.gamerz.support.qna.serviceImpl.QnaServiceImpl;

@WebServlet("/qnainsert.do")
public class QnaInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public QnaInsert() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		QnaService dao = new QnaServiceImpl();
		QnaVO vo = new QnaVO();

		vo.setQnaWriterId(request.getParameter("qnaWriterId"));
		vo.setQnaWriter(request.getParameter("qnaWriter"));
		vo.setQnaTitle(request.getParameter("qnaTitle"));
		vo.setQnaSubject(request.getParameter("qnaSubject"));
		vo.setQnaDate(LocalDate.parse(request.getParameter("qnaDate")));

		int n = dao.qnaInsert(vo);

		if (n == 1) {
			request.setAttribute("message", "FAQ 작성 성공.");
		} else {
			request.setAttribute("message", "FAQ 작성 실패.");
		}

		String viewName = "qna/qnamessage";
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
