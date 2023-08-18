package co.yedam.gamerz.community.post.mapper;

import java.util.List;

import co.yedam.gamerz.community.post.service.PostVO;

public interface PostMapper {
	List<PostVO> postSelectList();
	List<PostVO> postSearchtList(String key,String val);
	PostVO postSelect(PostVO vo);
	int postInsert(PostVO vo);
	int postUpdate(PostVO vo);
	int postDelete(PostVO vo);
	void postUpdateHit(int id);
}
