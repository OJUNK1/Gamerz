package co.yedam.gamerz.support.req.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.gamerz.common.DataSources;
import co.yedam.gamerz.support.req.Mapper.ReqMapper;
import co.yedam.gamerz.support.req.service.ReqService;
import co.yedam.gamerz.support.req.service.ReqVO;

public class ReqServiceImpl implements ReqService {

	private SqlSession sqlSession = DataSources.getInstance().openSession(true);
	private ReqMapper map = sqlSession.getMapper(ReqMapper.class);
	
	@Override
	public List<ReqVO> reqSelectList() {
		// TODO Auto-generated method stub
		return map.reqSelectList();
	}

	@Override
	public List<ReqVO> reqSearchtList(String key, String val) {
		// TODO Auto-generated method stub
		return map.reqSearchtList(key, val);
	}

	@Override
	public ReqVO reqSelect(ReqVO vo) {
		// TODO Auto-generated method stub
		return map.reqSelect(vo);
	}

	@Override
	public int reqInsert(ReqVO vo) {
		// TODO Auto-generated method stub
		return map.reqInsert(vo);
	}

	@Override
	public int reqUpdate(ReqVO vo) {
		// TODO Auto-generated method stub
		return map.reqUpdate(vo);
	}

	@Override
	public int reqDelete(ReqVO vo) {
		// TODO Auto-generated method stub
		return map.reqDelete(vo);
	}

	@Override
	public List<ReqVO> reqPaging(int pageNum, int amount) {
		// TODO Auto-generated method stub
		return map.reqPaging(pageNum, amount);
	}

	@Override
	public int reqTotalCount() {
		// TODO Auto-generated method stub
		return map.reqTotalCount();
	}

}
