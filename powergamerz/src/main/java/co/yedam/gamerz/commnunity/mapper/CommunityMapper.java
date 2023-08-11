package co.yedam.gamerz.commnunity.mapper;

import java.util.List;

import co.yedam.gamerz.commnunity.service.CommunityVO;

public interface CommunityMapper {
	List<CommunityVO> communitySelectList();
	List<CommunityVO> communitySearchtList(String key,String val);
	CommunityVO communitySelect(CommunityVO vo);
	int communityInsert(CommunityVO vo);
	int communityUpdate(CommunityVO vo);
	int communityDelete(CommunityVO vo);
}
