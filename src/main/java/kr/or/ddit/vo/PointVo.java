package kr.or.ddit.vo;

import lombok.Data;

@Data
public class PointVo {
	
	private int point_no;
	private int point_value;
	private int cust_no;
	private String point_state;
	private String point_date;
	private String point_content;
	
	
	//추가해야하는 부분은 아래에 서술
	
	private int total_point;
}
