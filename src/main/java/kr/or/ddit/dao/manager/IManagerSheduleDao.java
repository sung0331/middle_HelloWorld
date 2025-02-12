package kr.or.ddit.dao.manager;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.RideVo;
import kr.or.ddit.vo.SheduleVo;

public interface IManagerSheduleDao {

	int countShedule();

	List<SheduleVo> selectShedule(HashMap<String, Object> map);

	int deleteshedule(int shed_no);

	List<RideVo> getRideAll();

	int sheduleInsert(SheduleVo shedule);

}
