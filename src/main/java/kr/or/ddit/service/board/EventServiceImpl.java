package kr.or.ddit.service.board;

import java.util.List;

import kr.or.ddit.dao.board.EventDaoImpl;
import kr.or.ddit.dao.board.IEventDao;
import kr.or.ddit.vo.BoardVo;
import kr.or.ddit.vo.RideVo;

public class EventServiceImpl implements IEventService {
	private static EventServiceImpl instance;

	private EventServiceImpl() {

	}

	public static EventServiceImpl getInstacne() {
		if (instance == null) {
			instance = new EventServiceImpl();
		}
		return instance;
	}

	IEventDao eventDao = EventDaoImpl.getInstacne();

	@Override
	public List<BoardVo> eventList(){
		return eventDao.eventList();
	}

	@Override
	public List<RideVo> rideList() {
		return eventDao.rideList();
	}

	@Override
	public List<RideVo> rideDetailList() {
		return eventDao.rideDetailList();
	}

	
	

}
