package com.model;

public class RankingDTO {
	private String shop_num;
	private String shop_name;
	private String shop_content;
	private String shop_likes;
	private String shop_addr;
	private String shop_tel;
	private String shop_time;
	private String shop_kinds;
	private String shop_url;
	private String shop_img1;
	private String shop_img2;
	private String shop_img3;
	private String shop_img4;
	private String shop_img5;
	private String shop_id;
	private String kinds_id;
	
	public RankingDTO() {     }
	
	public RankingDTO(String shop_num, String shop_name, String shop_content, String shop_likes, String shop_addr, String shop_tel, String shop_time,
			String shop_kinds, String shop_url, String shop_img1, String shop_img2, String shop_img3, String shop_img4,
			String shop_img5, String shop_id, String kinds_id) {
		this.shop_num = shop_num;
		this.shop_name = shop_name;
		this.shop_content = shop_content;
		this.shop_likes = shop_likes;
		this.shop_addr = shop_addr;
		this.shop_tel = shop_tel;
		this.shop_time = shop_time;
		this.shop_kinds = shop_kinds;
		this.shop_url = shop_url;
		this.shop_img1 = shop_img1;
		this.shop_img2 = shop_img2;
		this.shop_img3 = shop_img3;
		this.shop_img4 = shop_img4;
		this.shop_img5 = shop_img5;
		this.shop_id = shop_id;
		this.kinds_id = kinds_id;
	}

	public RankingDTO(String shop_num, String shop_name, String shop_content, String shop_likes, String shop_addr,
			String shop_img1, String shop_img2, String shop_id) {
		this.shop_num = shop_num;
		this.shop_name = shop_name;
		this.shop_content = shop_content;
		this.shop_likes = shop_likes;
		this.shop_addr = shop_addr;
		this.shop_img1 = shop_img1;
		this.shop_img2 = shop_img2;
		this.shop_id = shop_id;
	}

	public RankingDTO(String shop_num, String shop_name, String shop_content, String shop_addr, String shop_tel,
			String shop_time, String shop_kinds, String shop_url, String shop_img1, String shop_img2,
			String shop_img3, String shop_img4, String shop_img5) {
		this.shop_num = shop_num;
		this.shop_name = shop_name;
		this.shop_content = shop_content;
		this.shop_addr = shop_addr;
		this.shop_tel = shop_tel;
		this.shop_time = shop_time;
		this.shop_kinds = shop_kinds;
		this.shop_url = shop_url;
		this.shop_img1 = shop_img1;
		this.shop_img2 = shop_img2;
		this.shop_img3 = shop_img3;
		this.shop_img4 = shop_img4;
		this.shop_img5 = shop_img5;
	}

	public String getShop_num() {
		return shop_num;
	}

	public void setShop_num(String shop_num) {
		this.shop_num = shop_num;
	}

	public String getShop_name() {
		return shop_name;
	}

	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}

	public String getShop_content() {
		return shop_content;
	}

	public void setShop_content(String shop_content) {
		this.shop_content = shop_content;
	}

	public String getShop_likes() {
		return shop_likes;
	}

	public void setShop_likes(String shop_likes) {
		this.shop_likes = shop_likes;
	}

	public String getShop_addr() {
		return shop_addr;
	}

	public void setShop_addr(String shop_addr) {
		this.shop_addr = shop_addr;
	}

	public String getShop_tel() {
		return shop_tel;
	}

	public void setShop_tel(String shop_tel) {
		this.shop_tel = shop_tel;
	}

	public String getShop_time() {
		return shop_time;
	}

	public void setShop_time(String shop_time) {
		this.shop_time = shop_time;
	}

	public String getShop_kinds() {
		return shop_kinds;
	}

	public void setShop_kinds(String shop_kinds) {
		this.shop_kinds = shop_kinds;
	}

	public String getShop_url() {
		return shop_url;
	}

	public void setShop_url(String shop_url) {
		this.shop_url = shop_url;
	}

	public String getShop_img1() {
		return shop_img1;
	}

	public void setShop_img1(String shop_img1) {
		this.shop_img1 = shop_img1;
	}

	public String getShop_img2() {
		return shop_img2;
	}

	public void setShop_img2(String shop_img2) {
		this.shop_img2 = shop_img2;
	}

	public String getShop_img3() {
		return shop_img3;
	}

	public void setShop_img3(String shop_img3) {
		this.shop_img3 = shop_img3;
	}

	public String getShop_img4() {
		return shop_img4;
	}

	public void setShop_img4(String shop_img4) {
		this.shop_img4 = shop_img4;
	}

	public String getShop_img5() {
		return shop_img5;
	}

	public void setShop_img5(String shop_img5) {
		this.shop_img5 = shop_img5;
	}

	public String getShop_id() {
		return shop_id;
	}

	public void setShop_id(String shop_id) {
		this.shop_id = shop_id;
	}

	public String getKinds_id() {
		return kinds_id;
	}

	public void setKinds_id(String kinds_id) {
		this.kinds_id = kinds_id;
	}

	
}
