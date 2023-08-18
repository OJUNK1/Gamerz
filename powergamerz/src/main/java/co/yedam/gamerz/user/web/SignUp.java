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
		String saveDir = getServletContext().getRealPath("attech/member/"); // 리눅스 유닉스 / 로 windows \ 디렉토리 표시
		int sizeLimit = 100*1024*1024;	
		MultipartRequest multi = new MultipartRequest(
						request,
						saveDir,
						sizeLimit,
						"utf-8",
						new DefaultFileRenamePolicy());
		
		String orginalFileName = multi.getOriginalFileName("file");
		if(orginalFileName != null) {
			String fileName = multi.getFilesystemName("file"); // 물리적 위치에 저장
 			vo.setMemberImg(fileName);
		}
		
		vo.setMemberId(multi.getParameter("memberId"));
		vo.setMemberName(multi.getParameter("memberName"));
		vo.setMemberPassword(multi.getParameter("memberPassword"));
		vo.setMemberBirth(multi.getParameter("memberBirth"));
		vo.setMemberEmail(multi.getParameter("memberPhone"));
		vo.setMemberEmail(multi.getParameter("memberAddress"));
		vo.setMemberEmail(multi.getParameter("memberEmail"));
		
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
