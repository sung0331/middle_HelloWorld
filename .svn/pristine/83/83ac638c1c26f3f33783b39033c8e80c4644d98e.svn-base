package kr.or.ddit.service.manager;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.dao.manager.IManagerVacationDao;
import kr.or.ddit.dao.manager.ManagerVacationDaoImpl;
import kr.or.ddit.vo.VacationVo;
import kr.or.ddit.vo.empVo;

public class ManagerVacationServiceImpl implements IManagerVacationService {
	private static ManagerVacationServiceImpl instance;

	private ManagerVacationServiceImpl() {
	}

	public static ManagerVacationServiceImpl getInstance() {
		if (instance == null) {
			instance = new ManagerVacationServiceImpl();
		}
		return instance;
	}
 IManagerVacationDao vacationDao=ManagerVacationDaoImpl.getInstance();
	@Override
	public int countVac() {
		return vacationDao.countVac();
	}

	@Override
	public List<empVo> selectVac(HashMap<String, Object> map) {
		return vacationDao.selectVac(map);
	}

	@Override
	public int changeState(VacationVo vacation) {
		return vacationDao.changeState(vacation);
	}

}
