package kr.or.ddit.service.manager;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.dao.manager.IManagerSheduleDao;
import kr.or.ddit.dao.manager.IManagerVacationDao;
import kr.or.ddit.dao.manager.ManagerSheduleDaoImpl;
import kr.or.ddit.dao.manager.ManagerVacationDaoImpl;
import kr.or.ddit.vo.RideVo;
import kr.or.ddit.vo.SheduleVo;

public class ManagerSheduleServiceImpl implements IManagerSheduleService {
private static ManagerSheduleServiceImpl instance;

private ManagerSheduleServiceImpl() {
}

public static ManagerSheduleServiceImpl getInstance() {
	if (instance == null) {
		instance = new ManagerSheduleServiceImpl();
	}
	return instance;
}
IManagerSheduleDao sheduleDao=ManagerSheduleDaoImpl.getInstance();

@Override
public int countShedule() {
	return sheduleDao.countShedule();
}

@Override
public List<SheduleVo> selectShedule(HashMap<String, Object> map) {
	return sheduleDao.selectShedule(map);
}

@Override
public int deleteshedule(int shed_no) {
	// TODO Auto-generated method stub
	return sheduleDao.deleteshedule(shed_no);
}

@Override
public List<RideVo> getRideAll() {
	// TODO Auto-generated method stub
	return sheduleDao.getRideAll();
}

@Override
public int sheduleInsert(SheduleVo shedule) {
	// TODO Auto-generated method stub
	return sheduleDao.sheduleInsert(shedule);
}


}
