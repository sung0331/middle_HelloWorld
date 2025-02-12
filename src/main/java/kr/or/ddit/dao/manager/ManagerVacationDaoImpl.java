package kr.or.ddit.dao.manager;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.mybatis.MyBatisDao;
import kr.or.ddit.vo.VacationVo;
import kr.or.ddit.vo.empVo;

public class ManagerVacationDaoImpl extends MyBatisDao implements IManagerVacationDao {
	private static ManagerVacationDaoImpl instance;

	private ManagerVacationDaoImpl() {
	}

	public static ManagerVacationDaoImpl getInstance() {
		if (instance == null) {
			instance = new ManagerVacationDaoImpl();
		}
		return instance;
	}

	@Override
	public int countVac() {
		return selectOne("managerVac.allCountVac");
	}

	@Override
	public List<empVo> selectVac(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return selectList("managerVac.selectVac",map);
	}

	@Override
	public int changeState(VacationVo vacation) {
		return update("managerVac.changeState", vacation);
	}

}
