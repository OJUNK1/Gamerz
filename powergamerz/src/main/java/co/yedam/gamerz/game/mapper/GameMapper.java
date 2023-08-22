package co.yedam.gamerz.game.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.yedam.gamerz.game.service.GameVO;

public interface GameMapper {
	List<GameVO> gameSelectList();

	List<GameVO> gameGenreList(@Param("key") String key);

	List<GameVO> gamePlatformList(@Param("val") String val);

	GameVO gameSelect(GameVO vo);

	
	List<GameVO> gamePaging(@Param("pageNum") int pageNum, @Param("amount") int amount);

	int gameTotalCount();
	


	int gameInsert(GameVO vo);

	int gameUpdate(GameVO vo);

	int gameDelete(GameVO vo);
}
