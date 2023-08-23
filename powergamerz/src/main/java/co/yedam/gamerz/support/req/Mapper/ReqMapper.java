package co.yedam.gamerz.support.req.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.yedam.gamerz.support.req.service.ReqVO;

public interface ReqMapper {
	List<ReqVO> reqSelectList();
	List<ReqVO> reqSearchtList(@Param("key") String key, @Param("val") String val);
	ReqVO reqSelect(ReqVO vo);
	int reqInsert(ReqVO vo);
	int reqUpdate(ReqVO vo);
	int reqDelete(ReqVO vo);
	List<ReqVO> reqPaging(@Param("pageNum") int pageNum, @Param("amount") int amount);
	int reqTotalCount();
}
