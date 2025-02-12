package kr.or.ddit.vo;

import lombok.Data;

@Data
public class SheduleVo {
	private int shed_no;
	private String shed_date;
	private int ride_no;
	private int emp_no;
	private String shed_start_time;
	private String shed_end_time;
	private int shed_state;
	
	//추가 
		private String emp_name;
		private String ride_name;

}
