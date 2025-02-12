package kr.or.ddit.service.myPage;

import java.util.List;

import kr.or.ddit.dao.MyPage.IMyPageDao;
import kr.or.ddit.dao.MyPage.MyPageDaoImpl;
import kr.or.ddit.mybatis.MyBatisDao;
import kr.or.ddit.vo.BuyCartVo;
import kr.or.ddit.vo.CartVo;
import kr.or.ddit.vo.CustomerVo;
import kr.or.ddit.vo.GradeVo;
import kr.or.ddit.vo.PointVo;

public class MyPageServiceImpl extends MyBatisDao implements IMyPageService {
    private static MyPageServiceImpl instance;

    private MyPageServiceImpl() {
    }

    public static MyPageServiceImpl getInstance() {
        if (instance == null) {
            instance = new MyPageServiceImpl();
        }
        return instance;
    }

    private IMyPageDao myPageDao = MyPageDaoImpl.getInstance();

    @Override
    public CustomerVo getUserInfo(int userNo) {
        return myPageDao.getUserInfo(userNo);
    }

    @Override
    public boolean updateUserProfile(CustomerVo cust) {
        // 사용자 정보 업데이트
        return myPageDao.updateUserProfile(cust);
    }

    @Override
    public boolean deleteUser(int userNo) {
        return myPageDao.deleteUser(userNo);
    }

    @Override
    public List<CustomerVo> memList() {
        return myPageDao.memList();
    }

    @Override
    public CustomerVo getMembership(Integer userNo) {
        return myPageDao.getMembership(userNo);
    }

    @Override
    public List<PointVo> getPointList(int userNo) {
        return myPageDao.getPointList(userNo);
    }

    @Override
    public PointVo getuserPoint(int userNo) {
        return myPageDao.getuserPoint(userNo);
    }

    @Override
    public List<CartVo> getCartItems(int userNo) {
        return myPageDao.getCartItems(userNo);
    }

    public boolean updateCartItemQuantity(CartVo cartItem) {
        return myPageDao.updateCartItemQuantity(cartItem);
    }

    public boolean deleteCartItem(CartVo cartItem) {
        return myPageDao.deleteCartItem(cartItem);
    }


    public String getPassword(int userNo) {
        return myPageDao.getPassword(userNo);
    }

    @Override
    public GradeVo getGradeByCustomer(int userNo) {
        GradeVo grade = myPageDao.selectGradeByCustomer(userNo);
        if (grade == null) {
            System.out.println("No grade found for userId: " + userNo);
        }
        return grade;
    }

    public List<BuyCartVo> getOrderList(int userNo) {
        return myPageDao.getOrderList(userNo);
    }

	@Override
	public List<CustomerVo> getCustomerList() {
		return myPageDao.getCustomerList();
	}






}

