package kr.or.ddit.service.manager;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.BoardVo;
import kr.or.ddit.vo.BuyCartVo;
import kr.or.ddit.vo.BuyVo;
import kr.or.ddit.vo.ProdCategoryVo;
import kr.or.ddit.vo.ProdImageVo;
import kr.or.ddit.vo.ProductVo;

public interface IManagerProdService {

	int countProd();

	List<ProductVo> selectProd(HashMap<String, Object> map);

	int prodDelete(int prod_no);

	List<ProdCategoryVo> getCate();

	int productInsert(ProductVo product);

	int productImgSet(ProdImageVo img);

	int countSell();

	List<BuyVo> selectSell(HashMap<String, Object> map);

	List<BuyCartVo> prodDetail(int buy_no);

	int sellUpdate(int buy_no);


	BuyVo chkBuycartNo(int cust_no);

	int totalPrice(int buy_no);



}
