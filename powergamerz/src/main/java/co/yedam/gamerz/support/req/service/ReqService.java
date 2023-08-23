package co.yedam.gamerz.support.req.service;

import java.util.List;

public interface ReqService {
	List<ReqVO> reqSelectList();
	List<ReqVO> reqSearchtList(String key,String val);
	ReqVO reqSelect(ReqVO vo);
	int reqInsert(ReqVO vo);
	int reqUpdate(ReqVO vo);
	int reqDelete(ReqVO vo);
	List<ReqVO> reqPaging(int pageNum, int amount);
	int reqTotalCount();
}
