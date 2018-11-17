package com.gvms.vo;

public class SubjectVO {

	private String subId;
	private String major;
	private String middle;
	private String subName;
	private String subScore;

	public SubjectVO() {
		
	}

	public String getSubId() {
		return subId;
	}

	public void setSubId(String subId) {
		this.subId = subId;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getMiddle() {
		return middle;
	}

	public void setMiddle(String middle) {
		this.middle = middle;
	}

	public String getSubName() {
		return subName;
	}

	public void setSubName(String subName) {
		this.subName = subName;
	}

	public String getSubScore() {
		return subScore;
	}

	public void setSubScore(String subScore) {
		this.subScore = subScore;
	}

	@Override
	public String toString() {
		return "SubjectVO [subId=" + subId + ", major=" + major + ", middle=" + middle + ", subName=" + subName
				+ ", subScore=" + subScore + "]";
	}

	
	
	


	

	
	
	
	
}
