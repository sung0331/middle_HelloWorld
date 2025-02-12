package kr.or.ddit.dao.manager;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.mybatis.MyBatisDao;
import kr.or.ddit.vo.DepartmentVo;
import kr.or.ddit.vo.empVo;

public class ManagerEmpDaoImpl extends MyBatisDao implements IManagerEmpDao {
	private static ManagerEmpDaoImpl instance;

	private ManagerEmpDaoImpl() {
	}

	public static ManagerEmpDaoImpl getInstance() {
		if (instance == null) {
			instance = new ManagerEmpDaoImpl();
		}
		return instance;
	}

	@Override
	public int countEmp() {
		return selectOne("managerEmp.allCountEmp");
	}

	@Override
	public List<empVo> selectEmp(HashMap<String, Object> map) {
		return selectList("managerEmp.selectEmp",map);
	}

	@Override
	public int deleteEmp(int emp_no) {
		return update("managerEmp.deleteEmp",emp_no);
	}

	@Override
	public List<empVo> selectEmpAll() {
		return selectList("managerEmp.selectEmpAll");
	}

	@Override
	public List<empVo> selectDepartment(HashMap<String, Object> map) {
		return selectList("managerEmp.selectDepartment",map);
	}

	@Override
	public List<DepartmentVo> departmentList() {
		return selectList("managerEmp.departmentList");
	}

	@Override
	public int changeDepartment(empVo emp) {
		return update("managerEmp.changeDepartment",emp);
	}

}
