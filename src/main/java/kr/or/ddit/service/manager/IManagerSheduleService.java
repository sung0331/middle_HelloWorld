package kr.or.ddit.service.manager;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.RideVo;
import kr.or.ddit.vo.SheduleVo;
import kr.or.ddit.vo.empVo;

public interface IManagerSheduleService {

	int countShedule();

	List<SheduleVo> selectShedule(HashMap<String, Object> map);

	int deleteshedule(int shed_no);

	List<RideVo> getRideAll();

	int sheduleInsert(SheduleVo shedule);



}
