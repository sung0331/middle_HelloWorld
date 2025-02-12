package kr.or.ddit.service.manager;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.dao.manager.IManagerProdDao;
import kr.or.ddit.dao.manager.ManagerProdDaoImpl;
import kr.or.ddit.vo.BoardVo;
import kr.or.ddit.vo.BuyCartVo;
import kr.or.ddit.vo.BuyVo;
import kr.or.ddit.vo.ProdCategoryVo;
import kr.or.ddit.vo.ProdImageVo;
import kr.or.ddit.vo.ProductVo;

public class ManagerProdServiceImpl implements IManagerProdService {
	private static ManagerProdServiceImpl instance;

	private ManagerProdServiceImpl() {
	}

	public static ManagerProdServiceImpl getInstance() {
		if (instance == null) {
			instance = new ManagerProdServiceImpl();
		}
		return instance;
	}
 IManagerProdDao prodDao=ManagerProdDaoImpl.getInstance();

@Override
public int countProd() {
	return prodDao.countProd();
}

@Override
public List<ProductVo> selectProd(HashMap<String, Object> map) {
	return prodDao.selectProd(map);
}

@Override
public int prodDelete(int prod_no) {
	return prodDao.prodDelete(prod_no);
}

@Override
public List<ProdCategoryVo> getCate() {
	// TODO Auto-generated method stub
	return prodDao.getCate();
}

@Override
public int productInsert(ProductVo product) {
	return prodDao.productInsert(product);
}

@Override
public int productImgSet(ProdImageVo img) {
	return prodDao.productImgSet(img);
}

@Override
public int countSell() {
	// TODO Auto-generated method stub
	return prodDao.countSell();
}

@Override
public List<BuyVo> selectSell(HashMap<String, Object> map) {
	return prodDao.selectSell(map);
}

@Override
public List<BuyCartVo> prodDetail(int buy_no) {
	return prodDao.prodDetail(buy_no);
}

@Override
public int sellUpdate(int buy_no) {
	return prodDao.sellUpdate(buy_no);
}

@Override
public BuyVo chkBuycartNo(int cust_no) {
	// TODO Auto-generated method stub
	return prodDao.chkBuycartNo(cust_no);
}

@Override
public int totalPrice(int buy_no) {
	// TODO Auto-generated method stub
	return prodDao.totalPrice(buy_no);
}


 
}
