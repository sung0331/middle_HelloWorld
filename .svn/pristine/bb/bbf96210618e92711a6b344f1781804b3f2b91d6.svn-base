package kr.or.ddit.dao.board;

import java.util.List;

import kr.or.ddit.mybatis.MyBatisDao;
import kr.or.ddit.vo.BoardVo;
import kr.or.ddit.vo.RideVo;

public class EventDaoImpl extends MyBatisDao implements IEventDao{
	
	private static EventDaoImpl instance;

	private EventDaoImpl() {

	}

	public static EventDaoImpl getInstacne() {
		if (instance == null) {
			instance = new EventDaoImpl();
		}
		return instance;
	}

	@Override
	public List<BoardVo> eventList() {
		return selectList("event.eventRead");
	}

	@Override
	public List<RideVo> rideList() {
		return selectList("event.ride");
	}

	@Override
	public List<RideVo> rideDetailList() {
		return selectList("event.ride");
	}

	

}
