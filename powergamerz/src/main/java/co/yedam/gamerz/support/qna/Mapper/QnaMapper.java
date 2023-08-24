package co.yedam.gamerz.support.qna.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.yedam.gamerz.support.qna.service.QnaVO;

public interface QnaMapper {
	List<QnaVO> qnaSelectList();

	List<QnaVO> qnaSearchtList(@Param("key") String key, @Param("val") String val);

	List<QnaVO> qnaMyList(@Param("key") String key, @Param("pageNum") int pageNum, @Param("amount") int amount);

	QnaVO qnaSelect(QnaVO vo);

	int qnaInsert(QnaVO vo);

	int qnaUpdate(QnaVO vo);

	int qnaDelete(QnaVO vo);

	List<QnaVO> qnaPaging(@Param("pageNum") int pageNum, @Param("amount") int amount);

	int qnaTotalCount();

	int qnaMyTotalCount(@Param("key") String key);
}
