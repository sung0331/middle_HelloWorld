package kr.or.ddit.dao.manager;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.mybatis.MyBatisDao;
import kr.or.ddit.vo.RideVo;
import kr.or.ddit.vo.SheduleVo;

public class ManagerSheduleDaoImpl extends MyBatisDao implements IManagerSheduleDao {
private static ManagerSheduleDaoImpl instance;

private ManagerSheduleDaoImpl() {
}

public static ManagerSheduleDaoImpl getInstance() {
	if (instance == null) {
		instance = new ManagerSheduleDaoImpl();
	}
	return instance;
}

@Override
public int countShedule() {
	return selectOne("managerShedule.countShedule");
}

@Override
public List<SheduleVo> selectShedule(HashMap<String, Object> map) {
	return selectList("managerShedule.selectShedule",map);
}

@Override
public int deleteshedule(int shed_no) {
	return update("managerShedule.deleteshedule", shed_no);
}

@Override
public List<RideVo> getRideAll() {
	// TODO Auto-generated method stub
	return selectList("managerShedule.getRideAll");
}

@Override
public int sheduleInsert(SheduleVo shedule) {
	return insert("managerShedule.sheduleInsert", shedule);
}


}
