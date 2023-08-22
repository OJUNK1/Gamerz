package co.yedam.gamerz.game.serviceImpl;



import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.gamerz.common.DataSources;
import co.yedam.gamerz.game.mapper.GameMapper;
import co.yedam.gamerz.game.service.GameService;
import co.yedam.gamerz.game.service.GameVO;

public class GameServiceImpl implements GameService {
	private SqlSession sqlSession = DataSources.getInstance().openSession(true);
	private GameMapper map = sqlSession.getMapper(GameMapper.class);

	@Override
	public List<GameVO> gameSelectList() {
		return map.gameSelectList();
	}

	@Override
	public GameVO gameSelect(GameVO vo) {
		return map.gameSelect(vo);
	}

	@Override
	public List<GameVO> gameGenreList(String key) {
		return map.gameGenreList(key);
	}

	@Override
	public List<GameVO> gamePlatformList(String val) {
		return map.gamePlatformList(val);
	}

	@Override
	public int gameInsert(GameVO vo) {
		return map.gameInsert(vo);
	}

	@Override
	public int gameUpdate(GameVO vo) {
		return map.gameUpdate(vo);
	}

	@Override
	public int gameDelete(GameVO vo) {
		return map.gameDelete(vo);
	}




	@Override
	public List<GameVO> gamePaging(int pageNum, int amount) {
		return map.gamePaging(pageNum, amount);
	}

	@Override
	public int gameTotalCount() {
		// TODO Auto-generated method stub
		return map.gameTotalCount();
	}


}
