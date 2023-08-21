package co.yedam.gamerz.community.post.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.gamerz.common.ViewResolve;
import co.yedam.gamerz.community.post.service.PostService;
import co.yedam.gamerz.community.post.service.PostVO;
import co.yedam.gamerz.community.post.serviceImpl.PostServiceImpl;

@WebServlet("/postselect.do")
public class PostSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PostSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostService dao = new PostServiceImpl();
		PostVO vo = new PostVO();
		vo.setPostId(Integer.valueOf(request.getParameter("postId")));
		
		System.out.println(request.getParameter("postId"));
		
		vo = dao.postSelect(vo);
		
		request.setAttribute("p", vo);
		String viewName = "community/postselect";
		
		ViewResolve.forward(request, response, viewName);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
