package co.yedam.gamerz.support.req.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.gamerz.common.ViewResolve;
import co.yedam.gamerz.common.vo.PagingVO;
import co.yedam.gamerz.support.req.service.ReqService;
import co.yedam.gamerz.support.req.service.ReqVO;
import co.yedam.gamerz.support.req.serviceImpl.ReqServiceImpl;

/**
 * Servlet implementation class ReqList
 */
@WebServlet("/reqlist.do")
public class ReqList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReqList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReqService dao = new ReqServiceImpl();
		List<ReqVO> reqs = new ArrayList<ReqVO>();
		
		reqs = dao.reqSelectList();
		request.setAttribute("reqs", reqs);
		
		int pageNum = 1;
		int amount = 10;
		// 페이지 번호를 클릭하는 경우
		if (request.getParameter("pageNum") != null && request.getParameter("amount") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			amount =Integer.parseInt(request.getParameter("amount"));
		}
		
		List<ReqVO> reqqpages = dao.reqPaging(pageNum, amount);
		int total = dao.reqTotalCount();
		PagingVO pagingVO = new PagingVO(pageNum, amount, total);

//		System.out.printf("시작페이지 %d, 마지막 페이지 %d",endPage, startPage);
		request.setAttribute("reqpages", reqqpages);
		request.setAttribute("pagingVO", pagingVO);
		
		String viewName = "req/reqlist";
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
