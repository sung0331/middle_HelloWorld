package kr.or.ddit.dao.MyPage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.ddit.mybatis.MyBatisDao;
import kr.or.ddit.mybatis.MybatisUtil;
import kr.or.ddit.vo.BoardVo;

public class MyPageBoardDaoImpl extends MyBatisDao implements IMyPageBoradDao {
    private static MyPageBoardDaoImpl instance;
    
//    private SqlSessionFactory sqlSessionFactory = MybatisUtil.getSqlSessionFactory();

    
    private IMyPageBoradDao myPageBoardDao;

    private MyPageBoardDaoImpl() {
        // 생성자에서는 데이터베이스 연결 등 초기화 작업을 수행할 수 있습니다.
    }

    public static MyPageBoardDaoImpl getInstance() {
        if (instance == null) {
            synchronized (MyPageBoardDaoImpl.class) {
                if (instance == null) {
                    instance = new MyPageBoardDaoImpl();
                }
            }
        }
        return instance;
    }
    
    
    @Override
    public List<BoardVo> getMyPosts(String custId) {
    	return selectList("getPosts", custId);
//    	return new ArrayList<>();
    }
    
    
    
    @Override
    public List<BoardVo> getReviews(String custId) {
            return selectList("getReviews", custId); // mapper의 getReviews 호출
        
    }



	@Override
	public List<BoardVo> selectList(HashMap<String, Object> map) {
		List<BoardVo> list = myPageBoardDao.selectList(map);
		return list;
	}



	@Override
	public int countMyPosts(int userNo) {
	    Integer result = selectOne("MyPage.countMyPosts", userNo);
	    // 결과가 null인 경우 0으로 처리
	    return (result != null) ? result : 0;
	}


	


	@Override
	public int countMyReviews(int userNo) {
		Integer result = selectOne("MyPage.countMyReviews", userNo);
	    // 결과가 null인 경우 0으로 처리
	    return (result != null) ? result : 0;
	}

	@Override
	public List<BoardVo> selectPostsPaging(HashMap<String, Object> map) {
		return selectList("MyPage.selectPostsPaging", map);
	}
	@Override
	public List<BoardVo> selectReviewsPaging(HashMap<String, Object> map) {
		return selectList("MyPage.selectReviewsPaging", map);
	}




//	@Override
//	public int getTotalPostCount(String userId) {
//		// TODO Auto-generated method stub
//		return 0;
//	}


    
    
	
	
}


