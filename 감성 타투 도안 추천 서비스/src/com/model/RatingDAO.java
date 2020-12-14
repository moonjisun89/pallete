package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RatingDAO {
	
	Connection conn = null;
	ResultSet rs = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	
	
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
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int sinsert(RatingDTO dto) {/* RATING TABLE�� INSERT */

		String mid = dto.getMember_id();
		ArrayList<String> ist = dto.getTattoo_id();
		
		try {
			conn();
			
			for (int i=0; i<ist.size(); i++) {
				String sql = "INSERT INTO rating(member_member_id, tattoo_tattoo_id, rating) VALUES (?, ?, 3)";
				psmt = conn.prepareStatement(sql);
	
				psmt.setString(1, mid);
				psmt.setString(2, ist.get(i));
	
				cnt = psmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

}
