package kr.or.ddit.service.manager;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.VacationVo;
import kr.or.ddit.vo.empVo;

public interface IManagerVacationService {

	int countVac();

	List<empVo> selectVac(HashMap<String, Object> map);

	int changeState(VacationVo vacation);

}
