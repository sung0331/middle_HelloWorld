package kr.or.ddit.service.manager;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.BoardImageVo;
import kr.or.ddit.vo.BoardVo;
import kr.or.ddit.vo.ProdImageVo;
import kr.or.ddit.vo.boardCodeVo;

public interface IManagerBoardService {

	// 전체 글 갯수 조회
	public int countList();

	// 범위 별 게시글 조회
	public List<BoardVo> selectList(HashMap<String, Object> map);

	// 개별 게시글 회
	public BoardVo boardDetail(int board_no);

	// 게시글 내용 변경
	public int boardUpdate(BoardVo board);

	public int boardDelete(int board_no);

	public int countAnnouncementList();

	public List<BoardVo> selectAnnouncementList(HashMap<String, Object> map);

	public int boardinsert(BoardVo board);

	public List<boardCodeVo> getBoardCodeAll();

	public int boardImgSet(BoardImageVo img);

}
