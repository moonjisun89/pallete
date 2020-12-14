package com.model;

public class MemberVO {
	private String member_id; //회원아이디
	private String member_pw; //회원비밀번호
	private String member_tel; //회원전화번호
	private String member_name; //회원명
	private String member_gender; //회원성별
	private String member_recommend; //회원관심타투
	private String member_addr; //회원주소
	private String member_post; //회원우편번호
	
	public MemberVO() {   } //생성자 메서드 명시적작성

	public MemberVO(int memberID, String member_id, String member_pw, String member_tel, String member_name,
			String member_gender, String member_recommend, String member_addr, String member_post) {
		super();
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_tel = member_tel;
		this.member_name = member_name;
		this.member_gender = member_gender;
		this.member_recommend = member_recommend;
		this.member_addr = member_addr;
		this.member_post = member_post;
	}
	
	public MemberVO(String member_id, String member_pw, String member_tel,
			String member_gender, String member_recommend, String member_addr, String member_post) {
		super();
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_tel = member_tel;
		this.member_gender = member_gender;
		this.member_recommend = member_recommend;
		this.member_addr = member_addr;
		this.member_post = member_post;
	}
	
	public MemberVO(String member_id, String member_pw) {
		super();
		this.member_id = member_id;
		this.member_pw = member_pw;
	}

	public MemberVO(String member_id, String member_pw, String member_tel, String member_name,
			String member_gender, String member_recommend, String member_addr, String member_post) {
		super();
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_tel = member_tel;
		this.member_name = member_name;
		this.member_gender = member_gender;
		this.member_recommend = member_recommend;
		this.member_addr = member_addr;
		this.member_post = member_post;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_tel() {
		return member_tel;
	}

	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_gender() {
		return member_gender;
	}

	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}

	public String getMember_recommend() {
		return member_recommend;
	}

	public void setMember_recommend(String member_recommend) {
		this.member_recommend = member_recommend;
	}

	public String getMember_addr() {
		return member_addr;
	}

	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}

	public String getMember_post() {
		return member_post;
	}

	public void setMember_post(String member_post) {
		this.member_post = member_post;
	}

	
	
}
