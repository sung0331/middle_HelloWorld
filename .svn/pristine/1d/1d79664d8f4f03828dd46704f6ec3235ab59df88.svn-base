package kr.or.ddit.service.manager;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.dao.manager.IManagerEmpDao;
import kr.or.ddit.dao.manager.ManagerEmpDaoImpl;
import kr.or.ddit.vo.DepartmentVo;
import kr.or.ddit.vo.empVo;

public class ManagerEmpServiceImpl implements IManagerEmpService {
	private static ManagerEmpServiceImpl instance;

	private ManagerEmpServiceImpl() {
	}

	public static ManagerEmpServiceImpl getInstance() {
		if (instance == null) {
			instance = new ManagerEmpServiceImpl();
		}
		return instance;
	}

	IManagerEmpDao empDao = ManagerEmpDaoImpl.getInstance();

	@Override
	public int countEmp() {
		return empDao.countEmp();
	}

	@Override
	public List<empVo> selectEmp(HashMap<String, Object> map) {
		return empDao.selectEmp(map);
	}

	@Override
	public int deleteEmp(int emp_no) {
		return empDao.deleteEmp(emp_no);

	}

	@Override
	public List<empVo> selectEmpAll() {
		return empDao.selectEmpAll();
	}

	@Override
	public List<empVo> selectDepartment(HashMap<String, Object> map) {
		return empDao.selectDepartment(map);
	}

	@Override
	public List<DepartmentVo> departmentList() {
		return empDao.departmentList();
	}

	@Override
	public int changeDepartment(empVo emp) {
		return empDao.changeDepartment(emp);
	}

}
