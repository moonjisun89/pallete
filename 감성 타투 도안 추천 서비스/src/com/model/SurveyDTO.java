package com.model;
public class SurveyDTO {
	
	private String tattoo_id;       
	private String category;       
	

	public SurveyDTO(String tattoo_id, String category) {
		super();
		this.tattoo_id = tattoo_id;
		this.category = category;
	}
	
	
	public SurveyDTO(String tattoo_id) {
		super();
		this.tattoo_id = tattoo_id;
	}
	
	
	public SurveyDTO() {}


	public String getTattoo_id() {
		return tattoo_id;
	}
	public void setTattoo_id(String tattoo_id) {
		this.tattoo_id = tattoo_id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}

}