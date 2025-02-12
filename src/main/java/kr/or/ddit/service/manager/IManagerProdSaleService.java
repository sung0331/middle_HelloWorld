package kr.or.ddit.service.manager;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.BuyCartVo;
import kr.or.ddit.vo.ProdSalesVo;

public interface IManagerProdSaleService {

	public List<BuyCartVo> selectGoods(HashMap<String, Integer> map);

	public List<BuyCartVo> selectTicket(HashMap<String, Integer> map);
}
