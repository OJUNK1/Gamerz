package co.yedam.gamerz.game.web;

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

import co.yedam.gamerz.game.service.GameService;
import co.yedam.gamerz.game.service.GameVO;
import co.yedam.gamerz.game.serviceImpl.GameServiceImpl;

@WebServlet("/gamelibrary.do")
public class GameList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GameList() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		GameService dao = new GameServiceImpl();
		List<GameVO> games = new ArrayList<GameVO>();
		

		games = dao.gameSelectList();
		request.setAttribute("games", games);


		int pageNum = 1;
		int amount = 10;
		// 페이지 번호를 클릭하는 경우
		if (request.getParameter("pageNum") != null && request.getParameter("amount") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			amount =Integer.parseInt(request.getParameter("amount"));
		}
		
		List<GameVO> gamepages = dao.gamePaging(pageNum, amount);
		int total = dao.gameTotalCount();
		PagingVO pagingVO = new PagingVO(pageNum, amount, total);

//		System.out.printf("시작페이지 %d, 마지막 페이지 %d",endPage, startPage);
		request.setAttribute("gamepages", gamepages);
		request.setAttribute("pagingVO", pagingVO);
		
			
		games = dao.gameSelectList();
		request.setAttribute("games", games);
				
		String viewName = "game/gamelibrary";
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
