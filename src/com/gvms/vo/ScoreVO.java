package com.gvms.vo;

public class ScoreVO extends SubjectVO{
	private String score_id;
	private String sub_id;
	private String stu_id;
	private String score_date;
	private String score_acq;
	
	public ScoreVO() {

	}

	public String getScore_id() {
		return score_id;
	}

	public void setScore_id(String score_id) {
		this.score_id = score_id;
	}

	public String getSub_id() {
		return sub_id;
	}

	public void setSub_id(String sub_id) {
		this.sub_id = sub_id;
	}

	public String getStu_id() {
		return stu_id;
	}

	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}

	public String getScore_date() {
		return score_date;
	}

	public void setScore_date(String score_date) {
		this.score_date = score_date;
	}

	public String getScore_acq() {
		return score_acq;
	}

	public void setScore_acq(String score_acq) {
		this.score_acq = score_acq;
	}
	

	@Override
	public String toString() {
		return "ScoreVO [score_id=" + score_id + ", sub_id=" + sub_id + ", stu_id=" + stu_id + ", score_date="
				+ score_date + ", score_acq=" + score_acq + "]";
	}
	
	
	
	
	
	
	
}
