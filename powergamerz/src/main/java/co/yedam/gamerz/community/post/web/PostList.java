package co.yedam.gamerz.community.post.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.gamerz.common.ViewResolve;
import co.yedam.gamerz.community.post.service.PostService;
import co.yedam.gamerz.community.post.service.PostVO;
import co.yedam.gamerz.community.post.serviceImpl.PostServiceImpl;

@WebServlet("/postlist.do")
public class PostList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PostList() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostService dao = new PostServiceImpl();
		List<PostVO> posts = new ArrayList<PostVO>();
		
		posts = dao.postSelectList();
		request.setAttribute("posts", posts);
		
		String viewName = "community/postlist";
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
