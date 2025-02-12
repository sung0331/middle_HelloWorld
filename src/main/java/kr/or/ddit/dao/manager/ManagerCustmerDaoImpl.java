package kr.or.ddit.dao.manager;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.mybatis.MyBatisDao;
import kr.or.ddit.vo.CustomerVo;

public class ManagerCustmerDaoImpl extends MyBatisDao implements IManagerCustomerDao {
	private static ManagerCustmerDaoImpl instance;

	private ManagerCustmerDaoImpl() {
	}

	public static ManagerCustmerDaoImpl getInstance() {
		if (instance == null) {
			instance = new ManagerCustmerDaoImpl();
		}
		return instance;
	}

	@Override
	public int countCustomer() {
		return selectOne("managerCustomer.allCountMember");

	}

	@Override
	public List<CustomerVo> selectCustomer(HashMap<String, Object> map) {
		return selectList("managerCustomer.selectCustomer",map);
	}

	@Override
	public int deleteCustomer(int cust_no) {
		return update("managerCustomer.deleteCustomer",cust_no);
	}

	@Override
	public CustomerVo customerDetail(int cust_no) {
		// TODO Auto-generated method stub
		return selectOne("managerCustomer.customerDetail",cust_no);
	}

}
