package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DesignDAO {

	Connection conn;
	PreparedStatement ps = null;
	ResultSet rs = null;
	DesignDTO info = null;
	ArrayList<DesignDTO> Design_list = new ArrayList<DesignDTO>();
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
	
	//지역명 버튼 선택시 타투샵 10개 보여주는 메서드
	public ArrayList<DesignDTO> kinds_select(String kind_id){
		conn();
		
		try {
			String sql = "select * from shop where kinds_id like ? order by shop_num limit 10";
			ps = conn.prepareStatement(sql);
			ps.setString(1, kind_id);
			rs = ps.executeQuery();
			
			while (rs.next()) {
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
				
				info = new DesignDTO(shop_num, shop_name, shop_content, shop_likes, shop_addr, shop_tel, shop_time, shop_kinds, shop_url, shop_img1, shop_img2, shop_img3, shop_img4, shop_img5, shop_id, kinds_id);
				Design_list.add(info);
			}
			if (Design_list.size() != 0) {
				System.out.println("DesignDAO kinds_select 성공");
			}else {
				System.out.println("DesignDAO kinds_select 실패");
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close();
		}
		return Design_list;
	}
	
	
	//전체버튼 선택 시 타투샵 10개 보여주는 메서드
	public ArrayList<DesignDTO> ds_select(){
		conn();
		
		try {
			String sql = "select * from shop order by shop_num limit 10";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
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
				
				info = new DesignDTO(shop_num, shop_name, shop_content, shop_likes, shop_addr, shop_tel, shop_time, shop_kinds, shop_url, shop_img1, shop_img2, shop_img3, shop_img4, shop_img5, shop_id, kinds_id);
				Design_list.add(info);
			}
			if (Design_list.size() != 0) {
				System.out.println("DesignDAO ds_select 성공");
			}else {
				System.out.println("DesignDAO ds_select 실패");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return Design_list;
	}
	
	
	//샵 선택시 상세정보 보여주는 메서드 
	public DesignDTO shop_select(String receive_num){
		conn();
		
		try {
			String sql = "select shop_num, shop_name, shop_content, shop_addr, shop_tel, shop_time, shop_kinds, shop_url, shop_img1, shop_img2, shop_img3, shop_img4, shop_img5 from shop where shop_num = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, receive_num);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				String shop_num = rs.getString(1);
				String shop_name = rs.getString(2);
				String shop_content = rs.getString(3);
				String shop_addr = rs.getString(4);
				String shop_tel = rs.getString(5);
				String shop_time = rs.getString(6);
				String shop_kinds = rs.getString(7);
				String shop_url = rs.getString(8);
				String shop_img1 = rs.getString(9);
				String shop_img2 = rs.getString(10);
				String shop_img3 = rs.getString(11);
				String shop_img4 = rs.getString(12);
				String shop_img5 = rs.getString(13);
				
				info = new DesignDTO(shop_num, shop_name, shop_content, shop_addr, shop_tel, shop_time, shop_kinds, shop_url, shop_img1, shop_img2, shop_img3, shop_img4, shop_img5);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return info;
	}
	
}
