package com.model;

public class BusinessVO {
	private String business_shop; //사업자회원 상호명
	private String business_id; //사업자회원 아이디
	private String business_pw; //사업자회원 비밀번호
	private String business_sns; //사업자회원 sns주소
	private String business_recommend; //사업자회원 추천타투
	private String business_addr; //사업자회원 주소
	private String business_post; //사업자회원 우편번호
	private String business_content; //사업자회원 내용
	private String business_file1; //사업자회원 사진첨부
	private String business_file2; //사업자회원 사진첨부
	private String business_file3; //사업자회원 사진첨부
	private String business_file4; //사업자회원 사진첨부
	
	public BusinessVO() {    } //생성자 메서드 명시적 작성

	public BusinessVO(String business_shop, String business_id, String business_pw, String business_sns,
			String business_recommend, String business_addr, String business_post, String business_content,
			String business_file1, String business_file2, String business_file3, String business_file4) {
		super();
		this.business_shop = business_shop;
		this.business_id = business_id;
		this.business_pw = business_pw;
		this.business_sns = business_sns;
		this.business_recommend = business_recommend;
		this.business_addr = business_addr;
		this.business_post = business_post;
		this.business_content = business_content;
		this.business_file1 = business_file1;
		this.business_file2 = business_file2;
		this.business_file3 = business_file3;
		this.business_file4 = business_file4;
	}
	
	public BusinessVO(String business_file1, String business_file2, String business_file3, String business_file4) {
		super();
		this.business_file1 = business_file1;
		this.business_file2 = business_file2;
		this.business_file3 = business_file3;
		this.business_file4 = business_file4;
		
	}
	
	
	public BusinessVO(String business_id, String business_pw) {
		super();
		this.business_id = business_id;
		this.business_pw = business_pw;
	}

	public String getBusiness_shop() {
		return business_shop;
	}

	public void setBusiness_shop(String business_shop) {
		this.business_shop = business_shop;
	}

	public String getBusiness_id() {
		return business_id;
	}

	public void setBusiness_id(String business_id) {
		this.business_id = business_id;
	}

	public String getBusiness_pw() {
		return business_pw;
	}

	public void setBusiness_pw(String business_pw) {
		this.business_pw = business_pw;
	}

	public String getBusiness_sns() {
		return business_sns;
	}

	public void setBusiness_sns(String business_sns) {
		this.business_sns = business_sns;
	}

	public String getBusiness_recommend() {
		return business_recommend;
	}

	public void setBusiness_recommend(String business_recommend) {
		this.business_recommend = business_recommend;
	}

	public String getBusiness_addr() {
		return business_addr;
	}

	public void setBusiness_addr(String business_addr) {
		this.business_addr = business_addr;
	}

	public String getBusiness_post() {
		return business_post;
	}

	public void setBusiness_post(String business_post) {
		this.business_post = business_post;
	}

	public String getBusiness_content() {
		return business_content;
	}

	public void setBusiness_content(String business_content) {
		this.business_content = business_content;
	}

	public String getBusiness_file1() {
		return business_file1;
	}

	public void setBusiness_file1(String business_file1) {
		this.business_file1 = business_file1;
	}

	public String getBusiness_file2() {
		return business_file2;
	}

	public void setBusiness_file2(String business_file2) {
		this.business_file2 = business_file2;
	}

	public String getBusiness_file3() {
		return business_file3;
	}

	public void setBusiness_file3(String business_file3) {
		this.business_file3 = business_file3;
	}

	public String getBusiness_file4() {
		return business_file4;
	}

	public void setBusiness_file4(String business_file4) {
		this.business_file4 = business_file4;
	}

}
