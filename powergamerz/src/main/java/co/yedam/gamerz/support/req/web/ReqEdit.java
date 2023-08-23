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
 * Servlet implementation class ReqEdit
 */
@WebServlet("/reqedit.do")
public class ReqEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReqEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReqService dao = new ReqServiceImpl();
		ReqVO vo = new ReqVO();
			
		vo.setReqId(Integer.valueOf(request.getParameter("reqId")));
		vo.setReqDate(LocalDate.parse(request.getParameter("reqDate")));
		vo.setReqTitle(request.getParameter("reqTitle"));
		vo.setReqSubject(request.getParameter("reqSubject"));
		
		String viewName = "req/reqselect";
		int n = dao.reqUpdate(vo);
		if( n==1) {
			vo = dao.reqSelect(vo);
			request.setAttribute("r", vo);
			ViewResolve.forward(request, response, viewName);
		}else {
			request.setAttribute("message", "글 수정 중 오류가 발생하였습니다.");
			viewName = "req/reqmessage";
			ViewResolve.forward(request, response, viewName);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
