package kr.or.ddit.service.manager;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.CustomerVo;

public interface IManagerCustomerService {
//회원수 체크
	public int countCustomer();
	// 회원 목록 출력

	public List<CustomerVo> selectCustomer(HashMap<String, Object> map);

	public int deleteCustomer(int cust_no);

	public CustomerVo customerDetail(int cust_no);

}
