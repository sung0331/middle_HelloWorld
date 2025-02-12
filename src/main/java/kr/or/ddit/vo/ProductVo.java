package kr.or.ddit.vo;

import lombok.Data;

@Data
public class ProductVo {
	
	private int prod_no;
	private String prod_name;
	private int prod_price;
	private String prod_comment;
	private int prod_cate_no;
	//추가해야하는 부분은 아래에 서술
	private int prod_cate_no2;
	private String prod_img_link;
}
