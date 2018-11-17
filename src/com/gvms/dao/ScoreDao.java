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
public ArrayList<ScoreVO> ScoreOptList(String stu_id) {
		
		ArrayList<ScoreVO> optList = new ArrayList<ScoreVO>();
		
		Connection conn = getConnection();
		PreparedStatement st;
		ResultSet rs = null;
		String sql = "SELECT SCO.SCORE_ID, SUB.SUB_MIDDLE, SUB.SUB_NAME, "
				   + "SUB.SUB_SCORE, NVL(TO_CHAR(SCO.SCORE_DATE,'YYYY.MM.DD'),'-') "
				   + "FROM TBL_SUB SUB, TBL_SCORE SCO "
				   + "WHERE SCO.SUB_ID = SUB.SUB_ID "
				   + "AND STU_ID = " + stu_id + " "
				   + "AND SUB.SUB_MAJOR = '선택' "
				   + "AND SUB.SUB_NAME NOT LIKE '%MIS%'";
		
		try {
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();
			
			while(rs.next()) {
				ScoreVO scoVo = new ScoreVO();
				scoVo.setScore_id(rs.getString(1));
				scoVo.setSub_middle(rs.getString(2));
				scoVo.setSub_name(rs.getString(3));
				scoVo.setSub_score(rs.getString(4));
				scoVo.setScore_date(rs.getString(5));
				
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
	String sql = "SELECT SCO.SCORE_ID ,SUB.SUB_MIDDLE, SUB.SUB_NAME, "
			   + "SCO.SCORE_ACQ, NVL(TO_CHAR(SCO.SCORE_DATE,'YYYY.MM.DD'),'-') "
			   + "FROM TBL_SUB SUB, TBL_SCORE SCO "
			   + "WHERE SCO.SUB_ID = SUB.SUB_ID "
			   + "AND STU_ID = " + stu_id + " "
			   + "AND SUB.SUB_MAJOR = '필수' "
			   + "AND SUB.SUB_NAME NOT LIKE '%MIS%'";
	
	try {
		st = conn.prepareStatement(sql);
		rs = st.executeQuery();
		
		while(rs.next()) {
			ScoreVO scoVo = new ScoreVO();
			scoVo.setScore_id(rs.getString(1));
			scoVo.setSub_middle(rs.getString(2));
			scoVo.setSub_name(rs.getString(3));
			scoVo.setScore_acq(rs.getString(4));
			scoVo.setScore_date(rs.getString(5));
			
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
				+ "SCORE_ID, SUB_ID, STU_ID, SCORE_DATE, SCORE_ACQ)" 
				+ "VALUES (SCORE_SEQ.NEXTVAL, ?, ?, ?, ?)"; 
	
		Connection conn = getConnection();
		PreparedStatement st;
		
		try {
		
			st = conn.prepareStatement(sql);
			st.setString(1, scoVo.getSub_id());
			st.setString(2, scoVo.getStu_id());
			st.setString(3, scoVo.getScore_date());
			st.setString(4, scoVo.getScore_acq());
			
			st.executeUpdate();
		}	catch(SQLException e) {
			e.printStackTrace();
		}	finally {
			dbClose();
		}
	}
	
// 학생점수데이터 수정	
	public void updateScore(ScoreVO scoVo) {
		String sql = "UPDATE TBL_SCORE SET SUB_ID =?, SCORE_DATE =?, SCORE_ACQ =?";
		
		Connection conn = null;
		PreparedStatement st = null;
		
		try {
			conn = getConnection();
			st = conn.prepareStatement(sql);
			
			st.setString(1, scoVo.getSub_id());
			st.setString(2, scoVo.getScore_date());
			st.setString(3, scoVo.getScore_acq());
			
			st.executeUpdate();
		}	catch(SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}
	
// 학생점수데이터 삭제
	public void deleteScore(ScoreVO scoVo) {
		String sql = "DELETE TBL_SCORE WHERE SCORE_ID=?";
		
		Connection conn =null;
		PreparedStatement st;
		
		try {
			conn = getConnection();
			st = conn.prepareStatement(sql);
			
			st.setString(1, scoVo.getScore_id());
			
			st.executeUpdate();
		}	catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
