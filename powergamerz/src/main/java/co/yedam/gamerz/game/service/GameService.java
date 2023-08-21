package co.yedam.gamerz.game.service;

import java.util.List;

public interface GameService {
	List<GameVO> gameSelectList();

	List<GameVO> gameGenreList(String key);

	List<GameVO> gamePlatformList(String val);

	GameVO gameSelect(GameVO vo);

	int gameInsert(GameVO vo);

	int gameUpdate(GameVO vo);

	int gameDelete(GameVO vo);

}
