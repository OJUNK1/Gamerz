package co.yedam.gamerz.user.web;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.gamerz.common.ViewResolve;
import co.yedam.gamerz.user.service.MemberService;
import co.yedam.gamerz.user.service.MemberVO;
import co.yedam.gamerz.user.serviceImpl.MemberServiceImpl;

/**
 * Servlet implementation class MemberUpdate
 */
@WebServlet("/memberupdate.do")
public class MemberUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
			
		vo.setMemberId(request.getParameter("memberId"));
		vo.setMemberName(request.getParameter("name2"));
		vo.setMemberBirth(request.getParameter("birth2"));
		vo.setMemberEmail(request.getParameter("email2"));
		vo.setMemberPhone(request.getParameter("phone2"));
		vo.setMemberAddress(request.getParameter("address2"));
		vo.setMemberAuthor(request.getParameter("author2"));
		
		String viewName = "user/adminmessage";
		int n = dao.memberUpdate(vo);
		if( n==1) {
			request.setAttribute("message", "글 수정 성공");
			ViewResolve.forward(request, response, viewName);
		}else {
			request.setAttribute("message", "글 수정 중 오류가 발생하였습니다.");
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
