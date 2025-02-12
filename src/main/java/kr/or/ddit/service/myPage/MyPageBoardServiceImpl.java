package kr.or.ddit.service.myPage;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.dao.MyPage.IMyPageBoradDao;
import kr.or.ddit.dao.MyPage.MyPageBoardDaoImpl;
import kr.or.ddit.mybatis.MyBatisDao;
import kr.or.ddit.vo.BoardVo;

public class MyPageBoardServiceImpl extends MyBatisDao implements IMyPageBoardService {

    private static MyPageBoardServiceImpl instance;

	private MyPageBoardServiceImpl() {

	}

	public static MyPageBoardServiceImpl getInstance() {
		if (instance == null) {
			instance = new MyPageBoardServiceImpl();
		}
		return instance;
	}

    private IMyPageBoradDao myPageBoardDao = MyPageBoardDaoImpl.getInstance();

    @Override
    public List<BoardVo> getMyPosts(String custId) {
        return myPageBoardDao.getMyPosts(custId);
    }
    
    @Override
    public int countMyPosts(int userNo) {
        return myPageBoardDao.countMyPosts(userNo);
    }

    @Override
    public List<BoardVo> getReviews(String custId) {
        return myPageBoardDao.getReviews(custId);
    }


	@Override
	public List<BoardVo> selectList(HashMap<String, Object> map) {
		List<BoardVo> list = myPageBoardDao.selectList(map);
		return list;
	}

	@Override
	public int countMyReviews(int userNo) {
		return myPageBoardDao.countMyReviews(userNo);
	}

	@Override
	public List<BoardVo> selectPostsPaging(HashMap<String, Object> map) {
		return myPageBoardDao.selectPostsPaging(map);
	}
	
	@Override
	public List<BoardVo> selectReviewsPaging(HashMap<String, Object> map) {
		return myPageBoardDao.selectReviewsPaging(map);
	}
}
