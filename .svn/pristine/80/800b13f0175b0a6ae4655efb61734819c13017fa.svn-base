package kr.or.ddit.dao.product;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.mybatis.MyBatisDao;
import kr.or.ddit.vo.BuyCartVo;
import kr.or.ddit.vo.BuyVo;
import kr.or.ddit.vo.PayVo;
import kr.or.ddit.vo.ProductVo;

public class ProductDaoImpl extends MyBatisDao implements IProductDao {

	private static ProductDaoImpl instance;

	private ProductDaoImpl() {
		// 생성자
	}

	public static ProductDaoImpl getInstance() {
		if (instance == null) {
			instance = new ProductDaoImpl();
		}
		return instance;
	}

	@Override
	public int countList() {
		return selectOne("product.allCountList");
	}

	@Override
	public List<ProductVo> selectList(HashMap<String, Object> map) {
		List<ProductVo> list = selectList("product.selectList", map);
		return list;
	}

	// 상품상세페이지
	@Override
	public ProductVo getProductDetail(int prodNo) {
		return selectOne("product.getProductDetail", prodNo);
	}

	@Override
	public BuyVo selectBuycart(int cust_no) {
		return selectOne("product.selectBuycart", cust_no);
	}

	@Override
	public int giveBuycart(BuyVo buy) {
		return insert("product.giveBuycart", buy);
	}

	@Override
	public int putCart(BuyCartVo buyCart) {
		return insert("product.putCart", buyCart);
	}

	@Override
	public int updateTotalPrice(BuyVo buy) {
		return update("product.updateTotalPrice", buy);
	}

	@Override
	public int putPayInfo(PayVo pay) {
		// TODO Auto-generated method stub
		return insert("product.putPayInfo", pay);
	}

}
