package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SurveyDAO {
	
	Connection conn = null;
	ResultSet rs = null;
	PreparedStatement psmt = null;
    ArrayList<SurveyDTO> svlist = new ArrayList<SurveyDTO>();
    String tattoo_id = null;
	
    
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
	
	
	public ArrayList<SurveyDTO> tselect() {
		try {
			conn(); 
			String sql = "SELECT tattoo_id FROM tattoo ORDER BY RAND() LIMIT 0, 25";
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while(rs.next()) {
				String tattoo_id = rs.getString(1);			
				SurveyDTO dto = new SurveyDTO(tattoo_id);
				svlist.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return svlist;
	}
	
	
	public String sv1(String userID) {
		try {
			conn(); 
			String sql = "SELECT * FROM survey_result_1 where member_member_id=?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userID);
			
			rs = psmt.executeQuery();

			if(rs.next()) {
				tattoo_id = rs.getString(2);			
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return tattoo_id;
	}	
	
	public String sv2(String userID) {
		try {
			conn(); 
			String sql = "SELECT * FROM survey_result_2 where member_member_id=?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userID);
			
			rs = psmt.executeQuery();

			if(rs.next()) {
				tattoo_id = rs.getString(2);			
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return tattoo_id;
	}	
	
	public String sv3(String userID) {
		try {
			conn(); 
			String sql = "SELECT * FROM survey_result_3 where member_member_id=?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userID);
			
			rs = psmt.executeQuery();

			if(rs.next()) {
				tattoo_id = rs.getString(2);			
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return tattoo_id;
	}	
	
	public String sv4(String userID) {
		try {
			conn(); 
			String sql = "SELECT * FROM survey_result_4 where member_member_id=?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userID);
			
			rs = psmt.executeQuery();

			if(rs.next()) {
				tattoo_id = rs.getString(2);			
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return tattoo_id;
	}	
	
	public String sv5(String userID) {
		try {
			conn(); 
			String sql = "SELECT * FROM survey_result_5 where member_member_id=?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userID);
			
			rs = psmt.executeQuery();

			if(rs.next()) {
				tattoo_id = rs.getString(2);			
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return tattoo_id;
	}
	
}