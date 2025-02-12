package kr.or.ddit.vo;

import lombok.Data;

@Data
public class CartVo {
	
	private int cart_no;
	private int amount;
	private int cust_no;
	private int prod_no;
	private int cart_state;
	
	//추가해야하는 부분은 아래에 서술
	private String prod_comment;
	
    private String prod_name; // 상품 이름
    
    private int price; // 가격 정보
    
    private String formattedPrice; // 포맷된 가격 정보

    // Getters and setters...
    public String getFormattedPrice() {
        return formattedPrice;
    }

    public void setFormattedPrice(String formattedPrice) {
        this.formattedPrice = formattedPrice;
    }

}
