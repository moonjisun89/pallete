package com.model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

public class ProductDAO {

	Connection conn = null;
	ResultSet rs = null;
	PreparedStatement psmt = null;
    ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();

	
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
	
	
	public ArrayList<ProductDTO> pselect() {
		try {
			conn(); 
			String sql = "SELECT * FROM product";
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while(rs.next()) {
				String p_num = rs.getString(1);			
				String p_name = rs.getString(2);		
				String p_img = rs.getString(3);			
				int p_price = rs.getInt(4);				
				String p_text = rs.getString(5);		
				String p_weight = rs.getString(6);		
				String p_detail = rs.getString(7);		

				ProductDTO dto = new ProductDTO(p_num, p_name, p_img, p_price, p_text, p_weight, p_detail);
				list.add(dto);
			}

			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}


}