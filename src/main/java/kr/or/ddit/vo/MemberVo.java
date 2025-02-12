package kr.or.ddit.vo;

import lombok.Data;

@Data
public class MemberVo {
	private int cust_no;
	private String cust_name;
	private int cust_age;
	private String cust_id;
	private String cust_pw;
	private int cust_type;
	private String cust_mail;
	private String cust_tel;
	private String cust_address1;
	private String cust_address2;
	private int state;
	//추가해야하는 부분은 아래에 서술
}
