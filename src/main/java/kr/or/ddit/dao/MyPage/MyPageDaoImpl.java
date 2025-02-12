package kr.or.ddit.dao.MyPage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.mybatis.MyBatisDao;
import kr.or.ddit.vo.BuyCartVo;
import kr.or.ddit.vo.CartVo;
import kr.or.ddit.vo.CustomerVo;
import kr.or.ddit.vo.GradeVo;
import kr.or.ddit.vo.PointVo;

public class MyPageDaoImpl extends MyBatisDao implements IMyPageDao {
    private static MyPageDaoImpl instance;
    
    
    private MyPageDaoImpl() {
    }

    public static MyPageDaoImpl getInstance() {
        if (instance == null) {
            instance = new MyPageDaoImpl();
        }
        return instance;
    }

    @Override
    public List<CustomerVo> memList() {
        return selectList("MyPage.memList");
    }

    @Override
    public CustomerVo getUserInfo(int userNo) {
        return selectOne("MyPage.getUserInfo", userNo);
    }

	@Override
	public CustomerVo getMembership(Integer userNo) {
		return selectOne("MyPage.getMembership",userNo);
	}


	@Override
	public boolean updateUserProfile(CustomerVo cust) {
	    return update("MyPage.updateUserProfile", cust) > 0;
	}


    @Override
    public boolean deleteUser(int userNo) {
    	 return delete("MyPage.deleteUser", userNo) > 0;
    }
    
    @Override
	public List<CustomerVo> getCustomerList() {
		return selectList("MyPage.getCustomerList");
	}


	@Override
	public List<PointVo> getPointList(int userNo) {
		return selectList("MyPage.getPointList",userNo);
	}
    
	@Override
	public PointVo getuserPoint(int userNo) {
		return selectOne("MyPage.getPoint", userNo);
	}

	@Override
	public List<CartVo> getCartItems(int userNo) {
		return selectList("MyPage.getCartItems", userNo);
	}
	
	@Override
	public boolean updateCartItemQuantity(CartVo cartItem) {
		return update("MyPage.updateCartItemQuantity", cartItem) > 0;
	}

	@Override
	public boolean deleteCartItem(CartVo cartItem) {
	    return delete("MyPage.deleteCartItem", cartItem) > 0 ;
	}


	@Override
	public String getPassword(int userNo) {
		return selectOne("MyPage.getPassword", userNo);
	}

	@Override
	public GradeVo selectGradeByCustomer(Integer userNo) {
		// TODO Auto-generated method stub
		return selectOne("MyPage.selectGradeByCustomer",userNo);
	}

	@Override
	public List<BuyCartVo> getOrderList(int userNo) {
		return selectList("MyPage.getOrderList", userNo);
	}

	


    
    
}

