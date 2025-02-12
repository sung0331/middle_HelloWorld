package kr.or.ddit.vo;

import lombok.Data;

@Data
public class RideVo {
	private int ride_no;
	private String ride_name;
	private String ride_comment;
	private int oper_people;
	private int oper_state;
	private String stop_reason;
	private String ride_img;
}
