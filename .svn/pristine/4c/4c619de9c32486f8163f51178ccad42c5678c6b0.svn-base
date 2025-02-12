package kr.or.ddit.service.employee;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.BoardVo;
import kr.or.ddit.vo.MakeVo;
import kr.or.ddit.vo.empVo;

public interface IEmpService {

	//회원 예약관리 리스트 db에서 가져오기 범위 별 게시글 조회
	public List<MakeVo> empList(HashMap<String, Object> map);
	//db에서 조직도 가져오기
	public List<empVo> empDepartment();
	//db에서 공지사항 가져오기
	public List<empVo> empBoard(empVo emp);
	public List<empVo> empDeailBoard();
	//연차 차감하는 db 적용하기
//	public empVo empVacationUpdate(int emp_no);
	
	//전체 게시판 조회 및 페이지 변경
	public int countList();
	
	//직원 일정표 가져오기
	public List<empVo> Vacation(empVo emp);
	public List<empVo> Shedule(empVo emp);
	
	
	//db에서 휴가 내용 가져오기
	public List<empVo> empVacation(empVo emp);
	//휴가 등록
	public boolean insertVacation(empVo emp);
	//휴가 승인 여부 확인
	public List<empVo> stateVacation(empVo emp);
	
	//예약 명단 사용 여부 확인 업데이트
	public int makeUpdate(MakeVo makeVo);
	
	//검색기능 넣고->가져오고
	public List<MakeVo> searchCustomer(String query);
	
	//회원 탈퇴
	public int deleteCustomer(int cust_no);
	//5개 이상 버튼
	public List<MakeVo> selectList(HashMap<String, Object> map);
	
}
