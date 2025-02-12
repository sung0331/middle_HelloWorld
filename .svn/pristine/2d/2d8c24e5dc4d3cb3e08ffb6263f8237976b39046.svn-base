package kr.or.ddit.service.myPage;

import kr.or.ddit.vo.BoardVo;

import java.util.HashMap;
import java.util.List;

public interface IMyPageBoardService {
	
    List<BoardVo> getMyPosts(String custId);
    
    int countMyPosts(int userNo);
    
    List<BoardVo> getReviews(String custId);
    
//    List<BoardVo> getMyPostsWithPaging(String userId, int startRow, int pageSize);
    
//    int getTotalPostCount(String userId);

	List<BoardVo> selectList(HashMap<String, Object> map);

	int countMyReviews(int userNo);

	List<BoardVo> selectPostsPaging(HashMap<String, Object> map);
	
	List<BoardVo> selectReviewsPaging(HashMap<String, Object> map);
}


