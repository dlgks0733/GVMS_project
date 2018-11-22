package com.gvms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.gvms.vo.ScoreVO;

// 2018-11-03 INSERT, UPDATE, DELETE 완료
// 기본 조회, 상세 조회 만들기
	
public class ScoreDao extends CommonDao{

	private ScoreDao(){
		
	}
	
	private static ScoreDao instance;
	
	public static ScoreDao getInstance() {
		if(instance == null) {
			instance = new ScoreDao();
		}
		return instance;
	}
	
//  READ 선택영역 쿼리
public ArrayList<ScoreVO> ScoreOptList(String stuId) {
		
		ArrayList<ScoreVO> optList = new ArrayList<ScoreVO>();
		
		Connection conn = getConnection();
		PreparedStatement st;
		ResultSet rs = null;
		String sql = "SELECT SCO.SCOREID, SUB.SUBID, SUB.MIDDLE, SUB.SUBNAME, "
				   + "SUB.SUBSCORE, NVL(TO_CHAR(SCO.SCOREDATE,'YYYY.MM.DD'),'-') "
				   + "FROM TBL_SUB SUB, TBL_SCORE SCO "
				   + "WHERE SCO.SUBID = SUB.SUBID "
				   + "AND STUID = " + stuId + " "
				   + "AND SUB.MAJOR = '선택' "
				   + "AND SUB.SUBNAME NOT LIKE '%MIS%' ORDER BY SCO.SCOREID DESC";
		
		try {
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();
			
			while(rs.next()) {
				ScoreVO scoVo = new ScoreVO();
				scoVo.setScoreId(rs.getString(1));
				scoVo.setSubId(rs.getString(2));
				scoVo.setMiddle(rs.getString(3));
				scoVo.setSubName(rs.getString(4));
				scoVo.setSubScore(rs.getString(5));
				scoVo.setScoreDate(rs.getString(6));
				
				optList.add(scoVo);
				
			}
			
		}	catch(SQLException e) {
			e.printStackTrace();
		}	finally {
			dbClose();
		}
		return optList;
	}



public ArrayList<ScoreVO> ScoreEssList(String stu_id) {
	
	ArrayList<ScoreVO> essList = new ArrayList<ScoreVO>();
	
	Connection conn = getConnection();
	PreparedStatement st;
	ResultSet rs = null;
	String sql = "SELECT SCO.SCOREID , SUB.SUBID, SUB.MIDDLE, SUB.SUBNAME, "
			   + "SCO.ACQSCORE, NVL(TO_CHAR(SCO.SCOREDATE,'YYYY.MM.DD'),'-') "
			   + "FROM TBL_SUB SUB, TBL_SCORE SCO "
			   + "WHERE SCO.SUBID = SUB.SUBID "
			   + "AND STUID = " + stu_id + " "
			   + "AND SUB.MAJOR = '필수' "
			   + "AND SUB.SUBNAME NOT LIKE '%MIS%' ORDER BY SCO.SCOREID DESC";
	
	try {
		st = conn.prepareStatement(sql);
		rs = st.executeQuery();
		
		while(rs.next()) {
			ScoreVO scoVo = new ScoreVO();
			scoVo.setScoreId(rs.getString(1));
			scoVo.setSubId(rs.getString(2));
			scoVo.setMiddle(rs.getString(3));
			scoVo.setSubName(rs.getString(4));
			scoVo.setAcqScore(rs.getString(5));
			scoVo.setScoreDate(rs.getString(6));
			
			essList.add(scoVo);
			
		}
		
	}	catch(SQLException e) {
		e.printStackTrace();
	}	finally {
		dbClose();
	}
	return essList;
}



//	학생점수데이터 등록
	public void insertScore(ScoreVO scoVo) {
		String sql = "INSERT INTO TBL_SCORE("
				+ "SCOREID, SUBID, STUID, SCOREDATE, ACQSCORE)" 
				+ "VALUES (SCORE_SEQ.NEXTVAL, ?, ?, ?, ?)"; 
	
		Connection conn = getConnection();
		PreparedStatement st;
		
		try {
		
			st = conn.prepareStatement(sql);
			st.setString(1, scoVo.getSubId());
			st.setString(2, scoVo.getStuId());
			st.setString(3, scoVo.getScoreDate());
			st.setString(4, scoVo.getAcqScore());
			
			st.executeUpdate();
		}	catch(SQLException e) {
			e.printStackTrace();
		}	finally {
			dbClose();
		}
	}
	
// 학생점수데이터 수정	
	public void updateScore(ScoreVO scoVo) {
		String sql = "UPDATE TBL_SCORE SET SUBID =?, SCOREDATE =?, ACQSCORE =? WHERE SCOREID =?";
		
		Connection conn = null;
		PreparedStatement st = null;
		
		try {
			conn = getConnection();
			st = conn.prepareStatement(sql);
			
			st.setString(1, scoVo.getSubId());
			st.setString(2, scoVo.getScoreDate());
			st.setString(3, scoVo.getAcqScore());
			st.setString(4, scoVo.getScoreId());
			
			st.executeUpdate();
		}	catch(SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}
	
// 학생점수데이터 삭제
	public void deleteScore(ScoreVO scoVo) {
		String sql = "DELETE TBL_SCORE WHERE SCOREID=?";
		
		Connection conn =null;
		PreparedStatement st;
		
		try {
			conn = getConnection();
			st = conn.prepareStatement(sql);
			
			st.setString(1, scoVo.getScoreId());
			
			st.executeUpdate();
		}	catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
	
public ArrayList<ScoreVO> SearchEssSubject(String subName) {
		
		ArrayList<ScoreVO> list = new ArrayList<ScoreVO>();
		
		String sql = "SELECT * FROM TBL_SUB WHERE SUBNAME LIKE  '%" + subName + "%' AND MAJOR = '필수'";
		
		
		Connection conn = getConnection();
		PreparedStatement st;
		ResultSet rs = null;
		
		try {
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();
			
			if(rs.next()) {
			ScoreVO scoVo = new ScoreVO();
			scoVo.setSubId(rs.getString("subId"));
			scoVo.setMajor(rs.getString("major"));
			scoVo.setMiddle(rs.getString("middle"));
			scoVo.setSubName(rs.getString("subName"));
			scoVo.setSubScore(rs.getString("subScore"));
			
			list.add(scoVo);
			}
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return list;
		
	}

public ArrayList<ScoreVO> SearchOptSubject(String subName) {
	
	ArrayList<ScoreVO> list = new ArrayList<ScoreVO>();
	
	String sql = "SELECT * FROM TBL_SUB WHERE SUBNAME LIKE  '%" + subName + "%' AND MAJOR = '선택'";
	
	
	Connection conn = getConnection();
	PreparedStatement st;
	ResultSet rs = null;
	
	try {
		st = conn.prepareStatement(sql);
		rs = st.executeQuery();
		
		if(rs.next()) {
		ScoreVO scoVo = new ScoreVO();
		scoVo.setSubId(rs.getString("subId"));
		scoVo.setMajor(rs.getString("major"));
		scoVo.setMiddle(rs.getString("middle"));
		scoVo.setSubName(rs.getString("subName"));
		scoVo.setSubScore(rs.getString("subScore"));
		
		list.add(scoVo);
		}
		
		
	} catch(SQLException e) {
		e.printStackTrace();
	} finally {
		dbClose();
	}
	return list;
	
}
	
	
}
