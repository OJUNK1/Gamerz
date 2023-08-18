package co.yedam.gamerz.user.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.yedam.gamerz.common.ViewResolve;
import co.yedam.gamerz.user.service.MemberService;
import co.yedam.gamerz.user.service.MemberVO;
import co.yedam.gamerz.user.serviceImpl.MemberServiceImpl;

@WebServlet("/signup.do")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SignUp() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		String saveDir = getServletContext().getRealPath("attach/member");
		int sizeLimit = 100 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(
				request,
				saveDir,
				sizeLimit,
				"utf-8",
				new DefaultFileRenamePolicy());
		
		String originalFile = multi.getOriginalFileName("file");
		if(originalFile != null) {
			String fileName = multi.getFilesystemName("file");
			vo.setMemberImg(originalFile);
			vo.setMemberDir(saveDir+fileName);
		}
		
		vo.setMemberId(multi.getParameter("memberId"));
		vo.setMemberName(multi.getParameter("memberName"));
		vo.setMemberPassword(multi.getParameter("memberPassword"));
		vo.setMemberBirth(multi.getParameter("memberBirth"));
		vo.setMemberEmail(multi.getParameter("memberPhone"));
		vo.setMemberEmail(multi.getParameter("memberAddress"));
		vo.setMemberEmail(multi.getParameter("memberEmail"));
		vo.setMemberImg(multi.getParameter("memberImg"));
		
		int n = dao.memberInsert(vo);
		if(n == 1) {
			request.setAttribute("message", "회원가입 완료");
		} else {
			request.setAttribute("message", "회원가입 실패");
		}
		
		String viewName = "user/message";
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
