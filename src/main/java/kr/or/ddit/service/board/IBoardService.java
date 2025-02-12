package kr.or.ddit.service.board;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.BoardVo;

public interface IBoardService {
 
	//전체 글 갯수 조회 
	public int countList();

	//범위 별 게시글 조회
	public List<BoardVo> selectList(HashMap<String, Object> map); 
	//개별 게시글 회
	public BoardVo boardDetail(int board_no);

}
