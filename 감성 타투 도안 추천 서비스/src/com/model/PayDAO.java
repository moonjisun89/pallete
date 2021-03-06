package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PayDAO {

	
	Connection conn;
	PreparedStatement ps = null;
	ResultSet rs = null;
	RankingDTO pay_list = null;
	ArrayList<RankingDTO> Ranking_list = new ArrayList<RankingDTO>();
	int cnt = 0;

	public void conn() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
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
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public RankingDTO pay_select(String pay){
		conn();
		
		try {
			String sql = "select * from shop where shop_num = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, pay);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				String shop_num = rs.getString(1);
				String shop_name = rs.getString(2);
				String shop_content = rs.getString(3);
				String shop_likes = rs.getString(4);
				String shop_addr = rs.getString(5);
				String shop_tel = rs.getString(6);
				String shop_time = rs.getString(7);
				String shop_kinds = rs.getString(8);
				String shop_url = rs.getString(9);
				String shop_img1 = rs.getString(10);
				String shop_img2 = rs.getString(11);
				String shop_img3 = rs.getString(12);
				String shop_img4 = rs.getString(13);
				String shop_img5 = rs.getString(14);
				String shop_id = rs.getString(15);
				String kinds_id = rs.getString(16);
				
				pay_list = new RankingDTO(shop_num, shop_name, shop_content, shop_likes, shop_addr, shop_tel, shop_time, shop_kinds, shop_url, shop_img1, shop_img2, shop_img3, shop_img4, shop_img5, shop_id, kinds_id);
				
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close();
		}
		
		return pay_list;
	}
}

