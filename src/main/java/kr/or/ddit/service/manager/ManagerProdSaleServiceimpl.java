package kr.or.ddit.service.manager;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.dao.manager.IManagerProdSaleDao;
import kr.or.ddit.dao.manager.ManagerIBoardDao;
import kr.or.ddit.dao.manager.ManagerProdSaleDaoImpl;
import kr.or.ddit.vo.BuyCartVo;
import kr.or.ddit.vo.ProdSalesVo;

public class ManagerProdSaleServiceimpl implements IManagerProdSaleService {
	private static ManagerProdSaleServiceimpl instance;

	private ManagerProdSaleServiceimpl() {
	}

	public static ManagerProdSaleServiceimpl getInstance() {
		if (instance == null) {
			instance = new ManagerProdSaleServiceimpl();
		}
		return instance;
	}
 IManagerProdSaleDao prodSaleDao=ManagerProdSaleDaoImpl.getInstance();
 
	@Override
	public List<BuyCartVo> selectGoods(HashMap<String, Integer> map) {
		return prodSaleDao.selectGoods(map);
	}

	@Override
	public List<BuyCartVo> selectTicket(HashMap<String, Integer> map) {
		return prodSaleDao.selectTicket(map);

	}

}
