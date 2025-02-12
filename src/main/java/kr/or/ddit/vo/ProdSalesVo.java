package kr.or.ddit.vo;

import lombok.Data;

@Data

public class ProdSalesVo {
	private int sales_no;
	private int prod_no;
	private int sales_month;
	private int sales_amount;
	//추가해야하는 부분은 아래에 서술
	private String prod_name;

}
