package kr.or.ddit.service.board;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.dao.board.BoardDaoImpl;
import kr.or.ddit.dao.board.IBoardDao;
import kr.or.ddit.vo.BoardVo;

public class BoardServiceImpl implements IBoardService {
private static BoardServiceImpl instance;

private BoardServiceImpl() {
}

public static BoardServiceImpl getInstance() {
	if (instance == null) {
		instance = new BoardServiceImpl();
	}
	return instance;
}

IBoardDao boardDao= BoardDaoImpl.getInstance();

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



}
