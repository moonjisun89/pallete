package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BusinessDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	BusinessVO info = null;
	ResultSet rs = null;
	
	public void conn() {
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
	
	public void close() {
		try {
			if(rs != null) {
				rs.close();
			}
			if(psmt != null) {
				psmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	
	//회원가입
	public int join(BusinessVO vo) {
		
		try {
			conn();
			
			String sql = "insert into business values(?,?,?,?,?,?,?,?,?,?,?,?)";
			psmt = conn.prepareStatement(sql); 
			
			psmt.setString(1, vo.getBusiness_shop());
			psmt.setString(2, vo.getBusiness_id());
			psmt.setString(3, vo.getBusiness_pw());
			psmt.setString(4, vo.getBusiness_sns());
			psmt.setString(5, vo.getBusiness_recommend());
			psmt.setString(6, vo.getBusiness_addr());
			psmt.setString(7, vo.getBusiness_post());
			psmt.setString(8, vo.getBusiness_content());
			psmt.setString(9, vo.getBusiness_file1());
			psmt.setString(10, vo.getBusiness_file2());
			psmt.setString(11, vo.getBusiness_file3());
			psmt.setString(12, vo.getBusiness_file4());
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	
	//로그인
	public BusinessVO login(BusinessVO vo) {
		try {
			conn();
			String sql = "select * from business where business_id = ? and business_pw = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getBusiness_id());
			psmt.setString(2, vo.getBusiness_pw());
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				String id = rs.getString(3);
				String pw = rs.getString(4);
				info = new BusinessVO(id, pw);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return info;
	}
	
	
	public int update(BusinessVO vo) {
		
		try {
			conn();
			String sql = "update business set business_shop=?, business_pw=?, business_sns=?, "
					+ "business_recommend=?, business_addr=?, business_post=?, business_content=?,  "
					+ "business_file1=?, business_file2=?, business_file3=?, business_file4=? where business_id = ?";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, vo.getBusiness_shop());
			psmt.setString(2, vo.getBusiness_pw());
			psmt.setString(3, vo.getBusiness_sns());
			psmt.setString(4, vo.getBusiness_recommend());
			psmt.setString(5, vo.getBusiness_addr());
			psmt.setString(6, vo.getBusiness_post());
			psmt.setString(7, vo.getBusiness_content());
			psmt.setString(8, vo.getBusiness_file1());
			psmt.setString(9, vo.getBusiness_file2());
			psmt.setString(10, vo.getBusiness_file3());
			psmt.setString(11, vo.getBusiness_file4());
			psmt.setString(12, vo.getBusiness_id());
			
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close();
		}
		return cnt;
	}
	
	//로그인 한 사업자의 마이페이지에 사진 출력하는 메서드
	public BusinessVO fileSelect(BusinessVO vo) {
		BusinessVO photo = null; //여기서 그냥 null값이 반환되는건가 쿼리문 실행되면 될텐데..
		
		try {
			conn();
			String sql = "select business_file1, business_file2, business_file3, business_file4 from business where business_id = ?" ;
			
			psmt = conn.prepareStatement(sql); // 이 문장을 보내기위해 담는 그릇
			psmt.setString(1, vo.getBusiness_id());
			rs = psmt.executeQuery();  //결과집합에 질의함.
			
			if(rs.next()) { 
				String business_file1 = rs.getString(1);
				String business_file2 = rs.getString(2);
				String business_file3 = rs.getString(3);
				String business_file4 = rs.getString(4);
				photo = new BusinessVO(business_file1, business_file2, business_file3, business_file4);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return photo; // 그리고 그걸 반환함.
	}
}
