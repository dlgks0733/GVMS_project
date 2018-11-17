package com.gvms.vo;

public class StudentVO {
	private String stuId;
	private String stuName;
	private String stuStat;
	private String stuIndex;
	private String scoreTotal;

	public StudentVO() {
		// TODO Auto-generated constructor stub
	}

	public String getStuId() {
		return stuId;
	}

	public void setStuId(String stuId) {
		this.stuId = stuId;
	}

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public String getStuStat() {
		return stuStat;
	}

	public void setStuStat(String stuStat) {
		this.stuStat = stuStat;
	}

	public String getStuIndex() {
		return stuIndex;
	}

	public void setStuIndex(String stuIndex) {
		this.stuIndex = stuIndex;
	}

	public String getScoreTotal() {
		return scoreTotal;
	}

	public void setScoreTotal(String scoreTotal) {
		this.scoreTotal = scoreTotal;
	}

	@Override
	public String toString() {
		return "StudentVO [stuId=" + stuId + ", stuName=" + stuName + ", stuStat=" + stuStat + ", stuIndex=" + stuIndex
				+ ", scoreTotal=" + scoreTotal + "]";
	}

	

	
	
	
	
	
}
