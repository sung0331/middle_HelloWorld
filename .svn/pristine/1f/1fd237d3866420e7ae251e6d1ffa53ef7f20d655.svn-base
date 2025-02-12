package kr.or.ddit.dao.manager;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.mybatis.MyBatisDao;
import kr.or.ddit.vo.BoardVo;
import kr.or.ddit.vo.BuyCartVo;
import kr.or.ddit.vo.ProdSalesVo;

public class ManagerProdSaleDaoImpl extends MyBatisDao implements IManagerProdSaleDao {
	private static ManagerProdSaleDaoImpl instance;

	private ManagerProdSaleDaoImpl() {
	}

	public static ManagerProdSaleDaoImpl getInstance() {
		if (instance == null) {
			instance = new ManagerProdSaleDaoImpl();
		}
		return instance;
	}

	@Override
	public List<BuyCartVo> selectGoods(HashMap<String, Integer> map) {
		List<BuyCartVo> list = selectList("MangerBuyCart.selectGoods", map);
		return list;
	}

	@Override
	public List<BuyCartVo> selectTicket(HashMap<String, Integer> map) {
		List<BuyCartVo> list = selectList("MangerBuyCart.selectTicket", map);
		return list;
	}
}
