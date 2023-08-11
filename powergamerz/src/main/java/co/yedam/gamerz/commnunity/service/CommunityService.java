package co.yedam.gamerz.commnunity.service;

import java.util.List;

public interface CommunityService {
	List<CommunityVO> communitySelectList();
	List<CommunityVO> communitySearchtList(String key,String val);
	CommunityVO communitySelect(CommunityVO vo);
	int communityInsert(CommunityVO vo);
	int communityUpdate(CommunityVO vo);
	int communityDelete(CommunityVO vo);
}
