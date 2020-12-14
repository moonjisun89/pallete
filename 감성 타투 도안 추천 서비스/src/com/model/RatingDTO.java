package com.model;

import java.util.ArrayList;

public class RatingDTO {

	private String member_id;					
	private ArrayList<String> tattoo_id;		
	private int rating;							
	
	
	public RatingDTO(String member_id, ArrayList<String> tattoo_id, int rating) {
		super();
		this.member_id = member_id;
		this.tattoo_id = tattoo_id;
		this.rating = rating;
	}
	

	public RatingDTO(String member_id, ArrayList<String> tattoo_id) {
		super();
		this.member_id = member_id;
		this.tattoo_id = tattoo_id;
	}

	
	public RatingDTO() {}
	

	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	public ArrayList<String> getTattoo_id() {
		return tattoo_id;
	}


	public void setTattoo_id(ArrayList<String> tattoo_id) {
		this.tattoo_id = tattoo_id;
	}


	public int getRating() {
		return rating;
	}


	public void setRating(int rating) {
		this.rating = rating;
	}
	
}
