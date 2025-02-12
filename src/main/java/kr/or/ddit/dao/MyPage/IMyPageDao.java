package kr.or.ddit.dao.MyPage;

import java.util.List;

import kr.or.ddit.vo.BuyCartVo;
import kr.or.ddit.vo.CartVo;
//import kr.or.ddit.vo.CartVo;
import kr.or.ddit.vo.CustomerVo;
import kr.or.ddit.vo.GradeVo;
import kr.or.ddit.vo.PointVo;

public interface IMyPageDao {
    public CustomerVo getUserInfo(int userNo);
    
    boolean updateUserProfile(CustomerVo cust);
    
    boolean deleteUser(int userNo);
    
    String getPassword(int userNo);
    
    public List<CustomerVo> getCustomerList();
    
    
    
    public List<CustomerVo> memList();
    
    public CustomerVo getMembership(Integer userNo);
    
    public List<PointVo> getPointList(int userNo);
    
    public PointVo getuserPoint(int userNo);
    
    
    
    List<CartVo> getCartItems(int userNo);
	
    public boolean updateCartItemQuantity(CartVo cartItem);
    
    public boolean deleteCartItem(CartVo cartNo);
    
    
    
    List<BuyCartVo> getOrderList(int userNo); 

	public GradeVo selectGradeByCustomer(Integer userNo);


	

	
}


