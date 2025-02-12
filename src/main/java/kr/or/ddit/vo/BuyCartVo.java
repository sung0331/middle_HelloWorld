package kr.or.ddit.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class BuyCartVo {
	private int prod_no;
	private int buy_no;
	private int amount;
	private Date rsvt_date;
	private int rate;
	private int cart_state;
	//추가해야하는 부분은 아래에 서술
	private String prod_name;
	private int prod_cate_no;
	private int prod_cate_no2;
	private String cust_name;
	private int total_price;
	private int prod_price;
	private int state;


}
