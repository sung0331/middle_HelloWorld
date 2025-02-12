package kr.or.ddit.service.myPage;

import java.util.List;

import kr.or.ddit.vo.BuyCartVo;
import kr.or.ddit.vo.CartVo;
//import kr.or.ddit.vo.CartVo;
import kr.or.ddit.vo.CustomerVo;
import kr.or.ddit.vo.GradeVo;
import kr.or.ddit.vo.PointVo;

public interface IMyPageService {
    public CustomerVo getUserInfo(int userNo);
    
    boolean updateUserProfile(CustomerVo cust);
    
    boolean deleteUser(int userNo);
    
    String getPassword(int userNo);
    
    List<CustomerVo> getCustomerList();
    
    
    
    public List<CustomerVo> memList();

	public CustomerVo getMembership(Integer userNo);

	public List<PointVo> getPointList(int userNo);
    
	public PointVo getuserPoint(int userNo);
	
	
	
	public List<CartVo> getCartItems(int userNo);
	
	public boolean updateCartItemQuantity(CartVo cartItem);
    
    public boolean deleteCartItem(CartVo cartItem);
    
    

	GradeVo getGradeByCustomer(int userNo);
    
	List<BuyCartVo> getOrderList(int userNo);

	
}
