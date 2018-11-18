package com.gvms.vo;

public class ScoreVO extends SubjectVO{
	private String scoreId;
	private String subId;
	private String stuId;
	private String scoreDate;
	private String acqScore;
	
	public ScoreVO() {

	}
	
	public String getScoreId() {
		return scoreId;
	}
	public void setScoreId(String scoreId) {
		this.scoreId = scoreId;
	}
	public String getSubId() {
		return subId;
	}
	public void setSubId(String subId) {
		this.subId = subId;
	}
	public String getStuId() {
		return stuId;
	}
	public void setStuId(String stuId) {
		this.stuId = stuId;
	}
	public String getScoreDate() {
		return scoreDate;
	}
	public void setScoreDate(String scoreDate) {
		this.scoreDate = scoreDate;
	}
	public String getAcqScore() {
		return acqScore;
	}
	public void setAcqScore(String acqScore) {
		this.acqScore = acqScore;
	}
	@Override
	public String toString() {
		return "ScoreVO [scoreId=" + scoreId + ", subId=" + subId + ", stuId=" + stuId + ", scoreDate=" + scoreDate
				+ ", acqScore=" + acqScore + "]";
	}
	
	
	
	
	
	
	
	
}
