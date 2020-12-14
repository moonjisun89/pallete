package com.model;

public class BbsVO {
	private int bbsID;//게시판 번호
	private String bbsTitle;//게시판 제목
	private String userID;//사용자 아이디
	private String bbsDate;// 게시판 작성시간
	private String bbsContent;//게시판 내용
	private String bbsImg;//게시판 이미지
	private int bbsAvailable;//1일 때 보임 0일때 안보임(삭제기능)
	
	public int getBbsID() {
		return bbsID;
	}
		
	public String getBbsTitle() {
		return bbsTitle;
	}
	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getBbsDate() {
		return bbsDate;
	}
	public void setBbsDate(String bbsDate) {
		this.bbsDate = bbsDate;
	}
	public String getBbsContent() {
		return bbsContent;
	}
	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}
	public String getBbsImg() {
		return bbsImg;
	}
	public void setBbsImg(String bbsImg) {
		this.bbsImg = bbsImg;
	}
	public int getBbsAvailable() {
		return bbsAvailable;
	}
	public void setBbsAvailable(int bbsAvailable) {
		this.bbsAvailable = bbsAvailable;
	}
	public void setBbsID(int bbsID) {
		this.bbsID = bbsID;
	}
}