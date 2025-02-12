package kr.or.ddit.dao.manager;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.mybatis.MyBatisDao;
import kr.or.ddit.vo.BoardVo;
import kr.or.ddit.vo.BuyCartVo;
import kr.or.ddit.vo.BuyVo;
import kr.or.ddit.vo.ProdCategoryVo;
import kr.or.ddit.vo.ProdImageVo;
import kr.or.ddit.vo.ProductVo;

public class ManagerProdDaoImpl extends MyBatisDao implements IManagerProdDao {
	private static ManagerProdDaoImpl instance;

	private ManagerProdDaoImpl() {
	}

	public static ManagerProdDaoImpl getInstance() {
		if (instance == null) {
			instance = new ManagerProdDaoImpl();
		}
		return instance;
	}

	@Override
	public int countProd() {
		return selectOne("managerProd.countProd");
	}

	@Override
	public List<ProductVo> selectProd(HashMap<String, Object> map) {
		return selectList("managerProd.selectProd", map);
	}

	@Override
	public int prodDelete(int prod_no) {
		return update("managerProd.prodDelete", prod_no);
	}

	@Override
	public List<ProdCategoryVo> getCate() {
		// TODO Auto-generated method stub
		return selectList("managerProd.getCate");
	
	}

	@Override
	public int productInsert(ProductVo product) {
		return insert("managerProd.productInsert", product);
	}

	@Override
	public int productImgSet(ProdImageVo img) {
		// TODO Auto-generated method stub
		return insert("managerProd.productImgSet", img);
	}

	@Override
	public int countSell() {
		// TODO Auto-generated method stub
		return selectOne("managerProd.countSell");
	}

	@Override
	public List<BuyVo> selectSell(HashMap<String, Object> map) {
		return selectList("managerProd.selectSell", map);
	}

	@Override
	public List<BuyCartVo> prodDetail(int buy_no) {
		return selectList("managerProd.prodDetail", buy_no);
	}

	@Override
	public int sellUpdate(int buy_no) {
		return update("managerProd.sellUpdate", buy_no);
	}


	@Override
	public BuyVo chkBuycartNo(int cust_no) {
		// TODO Auto-generated method stub
		return selectOne("product.chkBuycartNo",cust_no);
	}

	@Override
	public int totalPrice(int buy_no) {
		// TODO Auto-generated method stub
		return selectOne("product.totalPrice",buy_no);
	}

}
