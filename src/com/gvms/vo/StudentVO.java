package com.gvms.vo;

public class StudentVO {
	private String stu_id;
	private String stu_name;
	private String stu_stat;
	private String stu_index;
	private String score_total;
	
	public StudentVO() {
		// TODO Auto-generated constructor stub
	}

	public String getStu_id() {
		return stu_id;
	}

	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}

	public String getStu_name() {
		return stu_name;
	}

	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}

	public String getStu_stat() {
		return stu_stat;
	}

	public void setStu_stat(String stu_stat) {
		this.stu_stat = stu_stat;
	}

	public String getStu_index() {
		return stu_index;
	}

	public void setStu_index(String stu_index) {
		this.stu_index = stu_index;
	}

	public String getScore_total() {
		return score_total;
	}

	public void setScore_total(String score_total) {
		this.score_total = score_total;
	}

	@Override
	public String toString() {
		return "StudentVO [stu_id=" + stu_id + ", stu_name=" + stu_name + ", stu_stat=" + stu_stat + ", stu_index="
				+ stu_index + ", score_total=" + score_total + "]";
	}

	
	
	
	
	
}
