package com.model;
public class ProductDTO {
	
	private String p_num;        
	private String p_name;       
	private String p_img;       
	private int p_price;         
	private String p_text;       
	private String p_weight;     
	private String p_detail;     
	
	
	public ProductDTO(String p_num, String p_name, String p_img, int p_price, String p_text, String p_weight, String p_detail) {
		super(); 
		this.p_num = p_num;
		this.p_name = p_name;
		this.p_img = p_img;
		this.p_price = p_price;
		this.p_text = p_text;
		this.p_weight = p_weight;
		this.p_detail = p_detail;
	}
	
	
	public ProductDTO() {
		
	}


	public String getP_num() {
		return p_num;
	}


	public void setP_num(String p_num) {
		this.p_num = p_num;
	}


	public String getP_name() {
		return p_name;
	}


	public void setP_name(String p_name) {
		this.p_name = p_name;
	}


	public String getP_img() {
		return p_img;
	}


	public void setP_img(String p_img) {
		this.p_img = p_img;
	}


	public int getP_price() {
		return p_price;
	}


	public void setP_price(int p_price) {
		this.p_price = p_price;
	}


	public String getP_text() {
		return p_text;
	}


	public void setP_text(String p_text) {
		this.p_text = p_text;
	}


	public String getP_weight() {
		return p_weight;
	}


	public void setP_weight(String p_weight) {
		this.p_weight = p_weight;
	}



	public String getP_detail() {
		return p_detail;
	}


	public void setP_detail(String p_detail) {
		this.p_detail = p_detail;
	}
	
	
}