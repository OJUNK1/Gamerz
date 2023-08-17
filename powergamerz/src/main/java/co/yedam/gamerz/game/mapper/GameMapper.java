package co.yedam.gamerz.game.mapper;

import java.util.List;

import co.yedam.gamerz.game.service.GameVO;

public interface GameMapper {
	List<GameVO> gameSelectList();

	GameVO gameSelect(GameVO vo);

	int gameInsert(GameVO vo);

	int gameUpdate(GameVO vo);

	int gameDelete(GameVO vo);
}
