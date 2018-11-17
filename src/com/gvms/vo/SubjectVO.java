package com.gvms.vo;

public class SubjectVO {

	private String sub_id;
	private String sub_major;
	private String sub_middle;
	private String sub_name;
	private String sub_score;
	
	public SubjectVO() {
		
	}

	public String getSub_id() {
		return sub_id;
	}

	public void setSub_id(String sub_id) {
		this.sub_id = sub_id;
	}

	public String getSub_major() {
		return sub_major;
	}

	public void setSub_major(String sub_major) {
		this.sub_major = sub_major;
	}

	public String getSub_middle() {
		return sub_middle;
	}

	public void setSub_middle(String sub_middle) {
		this.sub_middle = sub_middle;
	}

	public String getSub_name() {
		return sub_name;
	}

	public void setSub_name(String sub_name) {
		this.sub_name = sub_name;
	}

	public String getSub_score() {
		return sub_score;
	}

	public void setSub_score(String sub_score) {
		this.sub_score = sub_score;
	}

	@Override
	public String toString() {
		return "SubjectVO [sub_id=" + sub_id + ", sub_major=" + sub_major + ", sub_middle=" + sub_middle + ", sub_name="
				+ sub_name + ", sub_score=" + sub_score + "]";
	}
	
	


	

	
	
	
	
}
