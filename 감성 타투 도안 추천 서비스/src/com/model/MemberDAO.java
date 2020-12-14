package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	MemberVO info = null;
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
	public int join(MemberVO vo) {
		
		try {
			conn();
			//여기서 에러..?
			String sql = "insert into member values(?,?,?,?,?,?,?,?)";
			psmt = conn.prepareStatement(sql); //왜 여기서 에러??
			
			psmt.setString(1, vo.getMember_id());
			psmt.setString(2, vo.getMember_pw());
			psmt.setString(3, vo.getMember_tel());
			psmt.setString(4, vo.getMember_name());
			psmt.setString(5, vo.getMember_gender());
			psmt.setString(6, vo.getMember_recommend());
			psmt.setString(7, vo.getMember_addr());
			psmt.setString(8, vo.getMember_post());
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(); 
		}
		return cnt;
	}
	
	
	//로그인
	public MemberVO login(MemberVO vo) {
		try {
			conn();
			String sql = "select * from member where member_id = ? and member_pw = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getMember_id());
			psmt.setString(2, vo.getMember_pw());
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				String id = rs.getString(1);
				String pw = rs.getString(2);
				info = new MemberVO(id, pw);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return info;
	}
	
	public int update(MemberVO vo) {
		
		try {
			conn();
			String sql = "update member set member_gender=?, member_pw=?, member_tel=?, "
					+ "member_recommend=?, member_addr=?, member_post=? where member_id = ?";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, vo.getMember_gender());
			psmt.setString(2, vo.getMember_pw());
			psmt.setString(3, vo.getMember_tel());
			psmt.setString(4, vo.getMember_recommend());
			psmt.setString(5, vo.getMember_addr());
			psmt.setString(6, vo.getMember_post());
			psmt.setString(7, vo.getMember_id());
			
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close();
		}
		return cnt;
	}
	
	
	public String myPage1(String userID) {
		
		String name = null;
		try {
			conn();
			String sql = "select member_name from member where member_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userID);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				name = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return name;
	}

}
