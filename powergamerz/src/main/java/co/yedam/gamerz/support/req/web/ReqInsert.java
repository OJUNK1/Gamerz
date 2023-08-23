package co.yedam.gamerz.support.req.web;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.gamerz.common.ViewResolve;
import co.yedam.gamerz.support.req.service.ReqService;
import co.yedam.gamerz.support.req.service.ReqVO;
import co.yedam.gamerz.support.req.serviceImpl.ReqServiceImpl;

/**
 * Servlet implementation class ReqInsert
 */
@WebServlet("/reqinsert.do")
public class ReqInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReqInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReqService dao = new ReqServiceImpl();
		ReqVO vo = new ReqVO();
		
		vo.setReqWriterId(request.getParameter("reqWriterId"));
		vo.setReqWriter(request.getParameter("reqWriter"));
		vo.setReqTitle(request.getParameter("reqTitle"));
		vo.setReqSubject(request.getParameter("reqSubject"));
		vo.setReqDate(LocalDate.parse(request.getParameter("reqDate")));
		
		int n = dao.reqInsert(vo);
		
		if(n==1) {
			request.setAttribute("message", "FAQ 작성 성공.");
		}else {
			request.setAttribute("message", "FAQ 작성 실패.");
		}
		
		String viewName = "req/reqmessage";
		ViewResolve.forward(request, response, viewName);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
