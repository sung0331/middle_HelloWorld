package kr.or.ddit.dao.product;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.BuyCartVo;
import kr.or.ddit.vo.BuyVo;
import kr.or.ddit.vo.PayVo;
import kr.or.ddit.vo.ProductVo;

public interface IProductDao {

	// 전체 글 갯수 조회
	public int countList();
	
	// 상품메인 범위 별 조회
	public List<ProductVo> selectList(HashMap<String, Object> map);

	// 상품상세 조회
	public ProductVo getProductDetail(int prodNo);

	public BuyVo selectBuycart(int cust_no);

	public int giveBuycart(BuyVo buy);

	public int putCart(BuyCartVo buyCart);

	public int updateTotalPrice(BuyVo buy);

	public int putPayInfo(PayVo pay);
	
}
