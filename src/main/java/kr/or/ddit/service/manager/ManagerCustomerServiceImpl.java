package kr.or.ddit.service.manager;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.dao.manager.IManagerCustomerDao;
import kr.or.ddit.dao.manager.ManagerCustmerDaoImpl;
import kr.or.ddit.vo.CustomerVo;

public class ManagerCustomerServiceImpl implements IManagerCustomerService{
	private static ManagerCustomerServiceImpl instance;

	private ManagerCustomerServiceImpl() {
	}

	public static ManagerCustomerServiceImpl getInstance() {
		if (instance == null) {
			instance = new ManagerCustomerServiceImpl();
		}
		return instance;
	}

	IManagerCustomerDao customerDao = ManagerCustmerDaoImpl.getInstance();

	@Override
	public int countCustomer() {
		return customerDao.countCustomer();
	}

	@Override
	public List<CustomerVo> selectCustomer(HashMap<String, Object> map) {
		return customerDao.selectCustomer(map);
	}

	@Override
	public int deleteCustomer(int cust_no) {
		return customerDao.deleteCustomer(cust_no);
	}

	@Override
	public CustomerVo customerDetail(int cust_no) {
		// TODO Auto-generated method stub
		return customerDao.customerDetail(cust_no);
	}
}
