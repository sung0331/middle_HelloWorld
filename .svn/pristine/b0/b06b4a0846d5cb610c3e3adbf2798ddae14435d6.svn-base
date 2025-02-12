package kr.or.ddit.service.manager;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.dao.manager.ManagerBoardDaoImpl;
import kr.or.ddit.dao.manager.ManagerIBoardDao;
import kr.or.ddit.vo.BoardImageVo;
import kr.or.ddit.vo.BoardVo;
import kr.or.ddit.vo.ProdImageVo;
import kr.or.ddit.vo.boardCodeVo;

public class ManagerBoardServiceImpl implements IManagerBoardService {
private static ManagerBoardServiceImpl instance;

private ManagerBoardServiceImpl() {
}

public static ManagerBoardServiceImpl getInstance() {
	if (instance == null) {
		instance = new ManagerBoardServiceImpl();
	}
	return instance;
}

ManagerIBoardDao boardDao= ManagerBoardDaoImpl.getInstance();

	@Override
	public int countList() {
		return boardDao.countList();

	}

	@Override
	public List<BoardVo> selectList(HashMap<String, Object> map) {
		List<BoardVo> list = boardDao.selectList(map);
		return list;
	}

	@Override
	public BoardVo boardDetail(int board_no) {
		
		return boardDao.boardDetail(board_no);
	}

	@Override
	public int boardUpdate(BoardVo board) {
		return boardDao.boardUpdate(board);
	}

	@Override
	public int countAnnouncementList() {
		return boardDao.countAnnouncementList();
	}

	@Override
	public List<BoardVo> selectAnnouncementList(HashMap<String, Object> map) {
		return boardDao.selectAnnouncementList(map);
	}

	@Override
	public int boardDelete(int board_no) {
		return boardDao.boardDelete(board_no);
	}

	@Override
	public int boardinsert(BoardVo board) {
		return boardDao.boardinsert(board);
	}

	@Override
	public List<boardCodeVo> getBoardCodeAll() {
		return boardDao.getBoardCodeAll();
	}

	@Override
	public int boardImgSet(BoardImageVo img) {
		// TODO Auto-generated method stub
		return boardDao.boardImgSet(img);
	}



}
