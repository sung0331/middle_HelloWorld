package kr.or.ddit.dao.board;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.mybatis.MyBatisDao;
import kr.or.ddit.vo.BoardVo;

public class BoardDaoImpl  extends MyBatisDao implements IBoardDao {

	private static BoardDaoImpl instance;

	private BoardDaoImpl() {
	}

	public static BoardDaoImpl getInstance() {
		if (instance == null) {
			instance = new BoardDaoImpl();
		}
		return instance;
	}

	@Override
	public int countList() {
		return selectOne("board.allCountList");

	}

	@Override
	public List<BoardVo> selectList(HashMap<String, Object> map) {
		List<BoardVo> list = selectList("managerBoard.selectList", map);
		return list;
	}

	@Override
	public BoardVo boardDetail(int board_no) {
		return selectOne("managerBoard.boardDetail", board_no);
	}

}
