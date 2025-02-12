package kr.or.ddit.service.board;

import java.util.List;

import kr.or.ddit.vo.BoardVo;
import kr.or.ddit.vo.RideVo;

public interface IEventService {
	
	public List<BoardVo> eventList();
	
	public List<RideVo> rideList();
	
	public List<RideVo> rideDetailList();
}
