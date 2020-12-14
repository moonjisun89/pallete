package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
    
    private Connection conn;
    private ResultSet rs;
    
    public BbsDAO(){ 
        try {					
        	String dbURL = "jdbc:mysql://220.93.165.169:3306/tattoo?serverTimezone=UTC";
            String dbID = "tmakxmaleldj";
            String dbPassword = "wlqdprkrhtlvek1!";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    //작성일자 메서드
    public String getDate() {
    	String SQL = "select now()"; //현재의 시간을 가져오는 MySQL의 문장
    	try {
    		PreparedStatement psmt = conn.prepareStatement(SQL);
    		rs = psmt.executeQuery();
    		if(rs.next()) {
    			return rs.getString(1);
    		}
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return ""; //데이터베이스 오류
    }
    
    
    //게시글 번호 부여 메서드
    public int getNext() {
    	//현재 게시글을 내림차순으로 조회하여 가장 마지막 글의 번호를 구한다
    	String SQL = "select bbsID from bbs order by bbsID desc";
    	try {
    		PreparedStatement psmt = conn.prepareStatement(SQL);
    		rs = psmt.executeQuery();
    		if(rs.next()) {
    			return rs.getInt(1) + 1; //가장최신글 번호 13에서 1더한값 14가 새로만들어지는 게시글 번호로 지정됨
    		}
    		return 1; //첫번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return -1; //데이터베이스 오류
    }
    
    //글쓰기 메서드 //이부분은 하나 더 추가했음. 기능 이상 없음
    public int write(String bbsTitle, String userID, String bbsContent, String bbsImg) {
    	String SQL = "insert into bbs values(?,?,?,?,?,?,?)";
    	try {
    		PreparedStatement psmt = conn.prepareStatement(SQL);
    		psmt.setInt(1, getNext());
    		psmt.setString(2, bbsTitle);
    		psmt.setString(3, userID);
    		psmt.setString(4, getDate());
    		psmt.setString(5, bbsContent);
    		psmt.setString(6, bbsImg);
    		psmt.setInt(7, 1); //글의 유효번호
    		return psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return -1; //데이터베이스 오류
    }
    
    //게시글 리스트 메서드  //이부분도 기능이상은 없음. 페이징이 문제.
    public ArrayList<BbsVO> getList(int pageNumber){
    	String SQL = "select * from bbs where bbsID < ? and bbsAvailable = 1 order by bbsID desc limit 10";
    	ArrayList<BbsVO> list = new ArrayList<BbsVO>();
    	try {
    		PreparedStatement psmt = conn.prepareStatement(SQL);
    		psmt.setInt(1, getNext() - (pageNumber - 1) * 10);
    		rs = psmt.executeQuery();
    		while(rs.next()) {
    			BbsVO bbs = new BbsVO();
    			bbs.setBbsID(rs.getInt(1));
    			bbs.setBbsTitle(rs.getString(2));
    			bbs.setUserID(rs.getString(3));
    			bbs.setBbsDate(rs.getString(4));
    			bbs.setBbsContent(rs.getString(5));
    			bbs.setBbsImg(rs.getString(6));
    			bbs.setBbsAvailable(rs.getInt(7));
    			list.add(bbs);
    		}
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return list;
    }
    
    //페이징 처리 메서드
    public boolean nextPage(int pageNumber) { 
    	String SQL = "select * from bbs where bbsID < ? and bbsAvailable = 1 order by bbsID desc limit 10";
    	try {
    		PreparedStatement psmt = conn.prepareStatement(SQL);
    		psmt.setInt(1, getNext() - (pageNumber - 1) * 10);
    		rs = psmt.executeQuery();
    		if(rs.next()) {
    			return true;
    		}
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return false;
    }
    
    
    //하나의 게시글을 보는 메서드
    public BbsVO getBbs(int bbsID) {
    	String SQL = "select * from bbs where bbsID = ?";
    	try {
    		PreparedStatement psmt = conn.prepareStatement(SQL);
    		psmt.setInt(1, bbsID);
    		rs = psmt.executeQuery();
    		if(rs.next()) {
    			BbsVO bbs = new BbsVO();
    			bbs.setBbsID(rs.getInt(1));
    			bbs.setBbsTitle(rs.getString(2));
    			bbs.setUserID(rs.getString(3));
    			bbs.setBbsDate(rs.getString(4));
    			bbs.setBbsContent(rs.getString(5));
    			bbs.setBbsImg(rs.getString(6));
    			bbs.setBbsAvailable(rs.getInt(7));
    			return bbs;
    		}
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return null;
    }
    
    //bbsImg 추가. 수정기능에서 사진도 변경할 수 있게끔.
    public int update(int bbsID, String bbsTitle, String bbsContent, String bbsImg) {
    	String SQL = "update bbs set bbsTitle = ?, bbsContent = ?, bbsImg = ? where bbsID = ?";
    	
    	try {
    		PreparedStatement psmt = conn.prepareStatement(SQL);
    		psmt.setString(1, bbsTitle);
    		psmt.setString(2, bbsContent);
    		psmt.setString(3, bbsImg);
    		psmt.setInt(4, bbsID);
    		return psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return -1; //데이터베이스 오류
    }
    
    
    //게시글 삭제 메서드
    public int delete(int bbsID) { //bbsID값을 받아옴
    	//실제 데이터를 삭제하는 것이 아니라 게시글 유효숫자를 '0'으로 수정한다
    	String SQL = "update bbs set bbsAvailable = 0 where bbsID = ?";
     	try {
    		PreparedStatement psmt = conn.prepareStatement(SQL);
    		psmt.setInt(1, bbsID);
    		return psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return -1; //데이터베이스 오류
    	
    }
    

    //관리자 공지사항
    public ArrayList<BbsVO> getListNotice(){
    	String SQL = "select * from bbs where bbsAvailable = 2";
    	ArrayList<BbsVO> list = new ArrayList<BbsVO>();
    	try {
    		PreparedStatement psmt = conn.prepareStatement(SQL);
    		rs = psmt.executeQuery();
    		while(rs.next()) {
    			BbsVO bbs = new BbsVO();
    			bbs.setBbsID(rs.getInt(1));
    			bbs.setBbsTitle(rs.getString(2));
    			bbs.setUserID(rs.getString(3));
    			bbs.setBbsDate(rs.getString(4));
    			bbs.setBbsContent(rs.getString(5));
    			bbs.setBbsImg(rs.getString(6));
    			bbs.setBbsAvailable(rs.getInt(7));
    			list.add(bbs);
    		}
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return list;
    }
    
    
}

