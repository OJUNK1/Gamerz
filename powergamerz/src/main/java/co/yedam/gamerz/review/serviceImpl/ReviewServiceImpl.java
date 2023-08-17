package co.yedam.gamerz.review.serviceImpl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.gamerz.common.DataSources;
import co.yedam.gamerz.review.mapper.ReviewMapper;
import co.yedam.gamerz.review.service.ReviewService;
import co.yedam.gamerz.review.service.ReviewVO;

public class ReviewServiceImpl implements ReviewService {
	private SqlSession sqlSession = DataSources.getInstance().openSession(true);
	private ReviewMapper map = sqlSession.getMapper(ReviewMapper.class);

	@Override
	public List<HashMap<String, Object>> reviewSelectList() {
		return map.reviewSelectList();
	}

	@Override
	public ReviewVO reviewSelect(ReviewVO vo) {

		return null;
	}

	@Override
	public int reviewInsert(ReviewVO vo) {

		return 0;
	}

	@Override
	public int reviewUpdate(ReviewVO vo) {

		return 0;
	}

	@Override
	public int reviewDelete(ReviewVO vo) {

		return 0;
	}

}
