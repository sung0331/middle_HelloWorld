package kr.or.ddit.vo;

import lombok.Data;

@Data
public class BuyVo {
	private int buy_no;
	private String buy_date;
	private int total_price;
	private String buy_address;
	private String cust_address1;
	private String cust_address2;
	private int state;
	private int cust_no;
	private int RNUM;
	private String cust_name;

}
