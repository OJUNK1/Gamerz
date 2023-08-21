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
import co.yedam.gamerz.game.service.GameService;
import co.yedam.gamerz.game.service.GameVO;
import co.yedam.gamerz.game.serviceImpl.GameServiceImpl;

@WebServlet("/populargames.do")
public class PopularGamesController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PopularGamesController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		GameService dao = new GameServiceImpl();
		List<GameVO> games = new ArrayList<GameVO>();

		games = dao.gameSelectList();
		request.setAttribute("games", games);

		String viewName = "game/populargames";
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
