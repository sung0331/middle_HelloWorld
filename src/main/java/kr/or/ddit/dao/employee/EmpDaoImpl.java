package kr.or.ddit.dao.employee;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.mybatis.MyBatisDao;
import kr.or.ddit.vo.CustomerVo;
import kr.or.ddit.vo.MakeVo;
import kr.or.ddit.vo.empVo;

public class EmpDaoImpl extends MyBatisDao implements IEmpDao {
	private static EmpDaoImpl instance;

	private EmpDaoImpl() {

	}

	public static EmpDaoImpl getInstacne() {
		if (instance == null) {
			instance = new EmpDaoImpl();
		}
		return instance;
	}

	@Override
	public List<MakeVo> empList(HashMap<String, Object> map) {
		List<MakeVo> empList = selectList("emp.empList",map);
		return empList;
	}

	@Override
	public List<empVo> empDepartment() {
		return selectList("emp.empDepartment");
	}

	@Override
	public List<empVo> empBoard(empVo emp) {
		return selectList("emp.empBoard",emp);
	}
	
	@Override
	public List<empVo> empDeailBoard() {
		return selectList("emp.empDeailBoard");
	}


//	@Override
//	public empVo empVacationUpdate(int emp_no) {
//		return selectOne("emp.empVacationUpdate",emp_no);
//	}

	@Override
	public int countList() {
		return selectOne("emp.countList");
	}

	@Override
	public List<empVo> Vacation(empVo emp) {
		return selectList("emp.Vacation",emp);
	}

	@Override
	public List<empVo> Shedule(empVo emp) {
		return selectList("emp.Shedule",emp);
	}

	
	@Override
	public List<empVo> empVacation(empVo emp) {
		return selectList("emp.empVacation",emp);
	}
	@Override
	public int insertVacation(empVo emp) {
		return insert("emp.insertVacation",emp);
        }

	@Override
	public List<empVo> stateVacation(empVo emp) {
		return selectList("emp.stateVacation",emp);
	}

	@Override
	public int makeUpdate(MakeVo makeVo) {
		return update("emp.makeUpdate",makeVo);
	}

	@Override
	public List<MakeVo> searchCustomer(String query) {
		 return selectList("search.searchCustomer",query);
	}

	@Override
	public int deleteCustomer(int cust_no) {
		return update("emp.deleteCustomer");
	}

	@Override
	public List<MakeVo> selectList(HashMap<String, Object> map) {
		return selectList("emp.selectList",map);
	}


}


	
	
	
	 

