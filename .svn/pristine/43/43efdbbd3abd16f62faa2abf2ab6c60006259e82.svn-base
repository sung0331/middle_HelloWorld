package kr.or.ddit.service.employee;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.dao.employee.EmpDaoImpl;
import kr.or.ddit.dao.employee.IEmpDao;
import kr.or.ddit.vo.MakeVo;
import kr.or.ddit.vo.empVo;

public class EmpServicelmpl implements IEmpService {
	private static EmpServicelmpl instance;

	private EmpServicelmpl() {

	}

	public static EmpServicelmpl getInstacne() {
		if (instance == null) {
			instance = new EmpServicelmpl();
		}
		return instance;
	}

	IEmpDao IEmpDao = EmpDaoImpl.getInstacne();		// 10/05

	@Override
	public List<MakeVo> empList(HashMap<String, Object> map) {
		List<MakeVo> empList = IEmpDao.empList(map);
		return empList;
	}

	@Override
	public List<empVo> empDepartment() {
		return IEmpDao.empDepartment();
	}

	@Override
	public List<empVo> empBoard(empVo emp) {
		return IEmpDao.empBoard(emp);
	}
	@Override
	public List<empVo> empDeailBoard() {
		return IEmpDao.empDeailBoard();
	}


//	@Override
//	public empVo empVacationUpdate(int emp_no) {
//		return IEmpDao.empVacationUpdate(emp_no);
//	}

	@Override
	public int countList() {
		return IEmpDao.countList();
	}

	@Override
	public List<empVo> Vacation(empVo emp) {
		return IEmpDao.Vacation(emp); 
	}
//	public List<empVo> getVacation() throws Exception {
//		return IEmpDao.getVacation();
	@Override
	public List<empVo> Shedule(empVo emp) {
		return IEmpDao.Shedule(emp);
	}

	@Override
	public List<empVo> empVacation(empVo emp) {
		return IEmpDao.empVacation( emp);//휴가 가져오기
	}
	@Override
	public boolean insertVacation(empVo emp) {
		int result = IEmpDao.insertVacation(emp);
		return result>0; //휴가 신청 넣기
	}

	@Override
	public List<empVo> stateVacation(empVo emp) {
		return IEmpDao.stateVacation(emp);//휴가 승인 여부 확인
	}

	@Override
	public int makeUpdate(MakeVo makeVo) {
		return IEmpDao.makeUpdate(makeVo);
	}

	@Override
	public List<MakeVo> searchCustomer(String query) {
		return IEmpDao.searchCustomer(query);
	}

	@Override
	public int deleteCustomer(int cust_no) {
		return IEmpDao.deleteCustomer(cust_no);
	}

	@Override
	public List<MakeVo> selectList(HashMap<String, Object> map) {
		List<MakeVo> selectList = IEmpDao.selectList(map);
		return selectList;
	}




}
