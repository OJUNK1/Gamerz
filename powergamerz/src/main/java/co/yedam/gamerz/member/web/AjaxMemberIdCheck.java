package co.yedam.gamerz.member.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.gamerz.member.service.MemberService;
import co.yedam.gamerz.member.service.MemberVO;
import co.yedam.gamerz.member.serviceImpl.MemberServiceImpl;

@WebServlet("/ajaxMemberIdCheck.do")
public class AjaxMemberIdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxMemberIdCheck() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		vo.setMemberId(request.getParameter("memberId"));
		
		vo = dao.memberSelect(vo);
		String txt = "yes";
		if(vo != null) {
			txt = "no";
		}
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().append(txt);
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
