package kr.or.ddit.vo;

import lombok.Data;

@Data
public class BoardVo {
	
	private int post_no;
	private String title;
	private String content;
	private String board_date;
//	private Date board_date;
	private int cnt;
	private int board_state;
	private int board_no;
	private int cust_no;
	//추가해야하는 부분은 아래에 서술
	private String writer;
	private String board_name;
	private String board_img_link;
}
