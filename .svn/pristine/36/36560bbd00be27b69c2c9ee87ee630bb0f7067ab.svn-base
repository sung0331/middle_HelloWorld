package kr.or.ddit.service.product;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.BoardVo;
import kr.or.ddit.vo.BuyCartVo;
import kr.or.ddit.vo.BuyVo;
import kr.or.ddit.vo.PayVo;
import kr.or.ddit.vo.ProductVo;

public interface IProductService {

	// 전체 글 갯수 조회
	public int countList();
	
	// 범위 별 게시글 조회
	public List<ProductVo> selectList(HashMap<String, Object> map);

	// 상품 상세 페이지
	public ProductVo getProductDetail(int prodNo);

	public BuyVo selectBuycart(int cust_no);

	public int giveBuycart(BuyVo buy);

	public int putCart(BuyCartVo buyCart);

	public int updateTotalPrice(BuyVo buy);

	public int putPayInfo(PayVo pay);

}
