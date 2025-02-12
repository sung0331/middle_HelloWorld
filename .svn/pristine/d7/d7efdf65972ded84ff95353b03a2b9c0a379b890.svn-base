package kr.or.ddit.dao.manager;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.mybatis.MyBatisDao;
import kr.or.ddit.vo.BoardImageVo;
import kr.or.ddit.vo.BoardVo;
import kr.or.ddit.vo.ProdImageVo;
import kr.or.ddit.vo.boardCodeVo;

public class ManagerBoardDaoImpl extends MyBatisDao implements ManagerIBoardDao {

	private static ManagerBoardDaoImpl instance;

	private ManagerBoardDaoImpl() {
	}

	public static ManagerBoardDaoImpl getInstance() {
		if (instance == null) {
			instance = new ManagerBoardDaoImpl();
		}
		return instance;
	}

	@Override
	public int countList() {
		return selectOne("managerBoard.allCountList");

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

	@Override
	public int boardUpdate(BoardVo board) {
		return update("managerBoard.boardUpdate", board);
	}

	@Override
	public int countAnnouncementList() {
		return selectOne("managerBoard.countAnnouncementList");
	}

	@Override
	public List<BoardVo> selectAnnouncementList(HashMap<String, Object> map) {
		List<BoardVo> list = selectList("managerBoard.selectAnnouncementList", map);
		return list;
	}

	@Override
	public int boardDelete(int board_no) {
		// TODO Auto-generated method stub
		return update("managerBoard.boardDelete", board_no);
	}

	@Override
	public int boardinsert(BoardVo board) {
		return insert("managerBoard.boardinsert", board);
	}

	@Override
	public List<boardCodeVo> getBoardCodeAll() {
		List<boardCodeVo> list = selectList("managerBoard.getBoardCodeAll");
		return list;
	}

	@Override
	public int boardImgSet(BoardImageVo img) {
		// TODO Auto-generated method stub
		return insert("managerBoard.boardImgSet", img);
	}
	

}
