package kr.or.ddit.service.product;


import java.util.HashMap;
import java.util.List;

import kr.or.ddit.dao.product.IProductDao;
import kr.or.ddit.dao.product.ProductDaoImpl;
import kr.or.ddit.vo.BuyCartVo;
import kr.or.ddit.vo.BuyVo;
import kr.or.ddit.vo.PayVo;
import kr.or.ddit.vo.ProductVo;

public class ProductServiceImpl implements IProductService {
	private static ProductServiceImpl instance;

	private ProductServiceImpl() {
		// 생성자
	}

	public static ProductServiceImpl getInstance() {
		if (instance == null) {
			instance = new ProductServiceImpl();
		}
		return instance;
	}
		
	IProductDao productDao = ProductDaoImpl.getInstance();

	// 전체 글 갯수 조회
	@Override
	public int countList() {
		return productDao.countList();
	}
	
	// 범위 별 게시글 조회
	@Override
	public List<ProductVo> selectList(HashMap<String, Object> map) {
		List<ProductVo> list = productDao.selectList(map);
		return list;
	}
	
	@Override
    public ProductVo getProductDetail(int prodNo) {
        return productDao.getProductDetail(prodNo);
    }

	@Override
	public BuyVo selectBuycart(int cust_no) {
		// TODO Auto-generated method stub
		return productDao.selectBuycart(cust_no);
	}

	@Override
	public int giveBuycart(BuyVo buy) {
		// TODO Auto-generated method stub
		return productDao.giveBuycart(buy);
	}

	@Override
	public int putCart(BuyCartVo buyCart) {
		// TODO Auto-generated method stub
		return productDao.putCart(buyCart);
	}

	@Override
	public int updateTotalPrice(BuyVo buy) {
		// TODO Auto-generated method stub
		return productDao.updateTotalPrice(buy);
	}

	@Override
	public int putPayInfo(PayVo pay) {
		// TODO Auto-generated method stub
		return productDao.putPayInfo(pay);
	}
	
}
