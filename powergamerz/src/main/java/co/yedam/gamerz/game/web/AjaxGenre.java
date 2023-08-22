package co.yedam.gamerz.game.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import co.yedam.gamerz.common.vo.PagingVO;
import co.yedam.gamerz.game.service.GameService;
import co.yedam.gamerz.game.service.GameVO;
import co.yedam.gamerz.game.serviceImpl.GameServiceImpl;

@WebServlet("/ajaxgenre.do")
public class AjaxGenre extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AjaxGenre() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// ajax를 이용해서 검색결과를 json으로 보내준다.
		GameService dao = new GameServiceImpl();
		List<GameVO> games = new ArrayList<GameVO>();

		int pageNum = 1;
		int amount = 12;
		if (request.getParameter("pageNum") != null && request.getParameter("amount") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			amount = Integer.parseInt(request.getParameter("amount"));
		}
		
		String key = request.getParameter("key");

		games = dao.gameGenreList(key, pageNum, amount);
		int total = dao.gameGenreTotalCount(key);
		PagingVO pagingVO = new PagingVO(pageNum, amount, total);
		
		request.setAttribute("games", games);
		request.setAttribute("pagingVO", pagingVO);
		
		ObjectMapper objectMapper = new ObjectMapper(); // json 객체를 만들기 위해 필요한 객체

		objectMapper.registerModule(new JavaTimeModule()); // LocalDate 처리
		objectMapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);// LocalDate 처리

		String data = objectMapper.writeValueAsString(games); // json 형태로 결과를 만들어줌

		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().append(data);
		return;

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
