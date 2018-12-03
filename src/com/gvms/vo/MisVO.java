package com.gvms.vo;

/**
 * 
 * @author OSJ
 *
 */

public class MisVO {

	private String scoreId;
	private String stuId;
	private String stuName;
	private String scoreDate;
	private String scoreSum;
	private String subScore;
	private String fromDate;
	private String toDate;

	public String getScoreId() {
		return scoreId;
	}

	public void setScoreId(String scoreId) {
		this.scoreId = scoreId;
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

	public String getScoreDate() {
		return scoreDate;
	}

	public void setScoreDate(String scoreDate) {
		this.scoreDate = scoreDate;
	}

	public String getScoreSum() {
		return scoreSum;
	}

	public void setSubScore(String subScore) {
		this.subScore = subScore;
	}
	public String getSubScore() {
		return subScore;
	}

	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getFromDate() {
		return fromDate;
	}

	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	public String getToDate() {
		return toDate;
	}

	public void setScoreSum(String scoreSum) {
		this.scoreSum = scoreSum;
	}

	@Override
	public String toString() {
		return "MisVO [scoreId=" + scoreId + ", stuId=" + stuId + ", stuName=" + stuName + ", scoreDate=" + scoreDate
				+ ", scoreSum=" + scoreSum + "]";
	}

}
