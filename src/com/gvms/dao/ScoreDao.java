package com.gvms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.gvms.vo.MisVO;
import com.gvms.vo.ScoreVO;
import com.gvms.vo.SubjectVO;

// 2018-11-03 INSERT, UPDATE, DELETE 완료
// 기본 조회, 상세 조회 만들기

public class ScoreDao extends CommonDao {

	private ScoreDao() {

	}

	private static ScoreDao instance;

	public static ScoreDao getInstance() {
		if (instance == null) {
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
				+ "SUB.SUBSCORE, TO_CHAR(SCO.SCOREDATE, 'YYYY-MM-DD') " + "FROM TBL_SUB SUB, TBL_SCORE SCO "
				+ "WHERE SCO.SUBID = SUB.SUBID " + "AND STUID = " + stuId + " " + "AND SUB.MAJOR = '선택' "
				+ "AND SUB.SUBNAME NOT LIKE '%MIS%' ORDER BY SCO.SCOREID DESC";

		try {
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();

			while (rs.next()) {
				ScoreVO scoVo = new ScoreVO();
				scoVo.setScoreId(rs.getString(1));
				scoVo.setSubId(rs.getString(2));
				scoVo.setMiddle(rs.getString(3));
				scoVo.setSubName(rs.getString(4));
				scoVo.setSubScore(rs.getString(5));
				scoVo.setScoreDate(rs.getString(6));

				optList.add(scoVo);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
				+ "SCO.ACQSCORE, TO_CHAR(SCO.SCOREDATE, 'YYYY-MM-DD') " + "FROM TBL_SUB SUB, TBL_SCORE SCO "
				+ "WHERE SCO.SUBID = SUB.SUBID " + "AND STUID = " + stu_id + " " + "AND SUB.MAJOR = '필수' "
				+ "  AND SUB.SUBNAME NOT LIKE '%MIS%' "
				+ "ORDER BY SCO.SCOREID DESC";

		try {
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();

			while (rs.next()) {
				ScoreVO scoVo = new ScoreVO();
				scoVo.setScoreId(rs.getString(1));
				scoVo.setSubId(rs.getString(2));
				scoVo.setMiddle(rs.getString(3));
				scoVo.setSubName(rs.getString(4));
				scoVo.setAcqScore(rs.getString(5));
				scoVo.setScoreDate(rs.getString(6));

				essList.add(scoVo);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return essList;
	}

//	학생점수데이터 등록
	public void insertScore(ScoreVO scoVo) {
		String sql = "INSERT INTO TBL_SCORE(SCOREID, SUBID, STUID, SCOREDATE, ACQSCORE)"
				+ "VALUES (SCORE_SEQ.NEXTVAL, ?, ?, TO_DATE(?, 'MM/DD/YYYY'), ?)";

		Connection conn = getConnection();
		PreparedStatement st;

		try {

			st = conn.prepareStatement(sql);
			st.setString(1, scoVo.getSubId());
			st.setString(2, scoVo.getStuId());
			st.setString(3, scoVo.getScoreDate());
			st.setString(4, scoVo.getAcqScore());

			st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}

// 학생점수데이터 삭제
	public void deleteScore(ScoreVO scoVo) {
		String sql = "DELETE TBL_SCORE WHERE SCOREID=?";

		Connection conn = null;
		PreparedStatement st;

		try {
			conn = getConnection();
			st = conn.prepareStatement(sql);

			st.setString(1, scoVo.getScoreId());

			st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public ArrayList<ScoreVO> SearchEssSubject(String subName) {

		ArrayList<ScoreVO> list = new ArrayList<ScoreVO>();

		String sql = "SELECT * FROM TBL_SUB WHERE SUBNAME LIKE  '%" + subName + "%' AND MAJOR = '필수'"
				+ "		 AND SUBNAME NOT LIKE '%MIS%'";

		Connection conn = getConnection();
		PreparedStatement st;
		ResultSet rs = null;

		try {
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();

			if (rs.next()) {
				ScoreVO scoVo = new ScoreVO();
				scoVo.setSubId(rs.getString("subId"));
				scoVo.setMajor(rs.getString("major"));
				scoVo.setMiddle(rs.getString("middle"));
				scoVo.setSubName(rs.getString("subName"));
				scoVo.setSubScore(rs.getString("subScore"));

				list.add(scoVo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return list;

	}

	public ArrayList<ScoreVO> allEssSubject() {

		ArrayList<ScoreVO> allEssList = new ArrayList<ScoreVO>();

		String sql = "SELECT * FROM TBL_SUB WHERE MAJOR = '필수'"
				+ "		 AND SUBNAME NOT LIKE '%MIS%'";

		Connection conn = getConnection();
		PreparedStatement st;
		ResultSet rs = null;

		try {
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();

			while(rs.next()) {
				ScoreVO scoVo = new ScoreVO();
				scoVo.setSubId(rs.getString("subId"));
				scoVo.setMajor(rs.getString("major"));
				scoVo.setMiddle(rs.getString("middle"));
				scoVo.setSubName(rs.getString("subName"));
				scoVo.setSubScore(rs.getString("subScore"));

				allEssList.add(scoVo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return allEssList;

	}

	public ArrayList<ScoreVO> SearchOptSubject(String subName) {

		ArrayList<ScoreVO> list = new ArrayList<ScoreVO>();

		String sql = "SELECT * FROM TBL_SUB WHERE SUBNAME LIKE  '%" + subName + "%' AND MAJOR = '선택' AND SUBNAME NOT LIKE '%MIS%'";

		Connection conn = getConnection();
		PreparedStatement st;
		ResultSet rs = null;

		try {
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();

			if (rs.next()) {
				ScoreVO scoVo = new ScoreVO();
				scoVo.setSubId(rs.getString("subId"));
				scoVo.setMajor(rs.getString("major"));
				scoVo.setMiddle(rs.getString("middle"));
				scoVo.setSubName(rs.getString("subName"));
				scoVo.setSubScore(rs.getString("subScore"));

				list.add(scoVo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return list;

	}

	public ArrayList<ScoreVO> allOptSubject() {

		ArrayList<ScoreVO> list = new ArrayList<ScoreVO>();

		String sql = "SELECT * FROM TBL_SUB WHERE MAJOR = '선택' AND SUBNAME NOT LIKE '%MIS%'";

		Connection conn = getConnection();
		PreparedStatement st;
		ResultSet rs = null;

		try {
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();

			while (rs.next()) {
				ScoreVO scoVo = new ScoreVO();
				scoVo.setSubId(rs.getString("subId"));
				scoVo.setMajor(rs.getString("major"));
				scoVo.setMiddle(rs.getString("middle"));
				scoVo.setSubName(rs.getString("subName"));
				scoVo.setSubScore(rs.getString("subScore"));

				list.add(scoVo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return list;

	}

	public ArrayList<ScoreVO> selectAllSubList() {
		String sql = "select * from TBL_SUB WHERE SUBNAME <> 'MIS'";
		ArrayList<ScoreVO> list = new ArrayList<ScoreVO>();
		Connection conn = getConnection();
		PreparedStatement st;
		ResultSet rs = null;

		try {
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();

			while (rs.next()) {
				ScoreVO scoVO = new ScoreVO(); // subjectVO subVO = null;

				scoVO.setSubId(rs.getString("subId"));
				scoVO.setMajor(rs.getString("major"));
				scoVO.setMiddle(rs.getString("middle"));
				scoVO.setSubName(rs.getString("subName"));
				scoVO.setSubScore(rs.getString("subScore"));

				list.add(scoVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return list;

	}

	public ArrayList<ScoreVO> SearchSubject(String subName) {

		ArrayList<ScoreVO> list = new ArrayList<ScoreVO>();

		String sql = "SELECT * FROM TBL_SUB WHERE SUBNAME LIKE  '%" + subName + "%' AND SUBNAME <> 'MIS'";

		Connection conn = getConnection();
		PreparedStatement st;
		ResultSet rs = null;

		try {
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();

			if (rs.next()) {
				ScoreVO scoVo = new ScoreVO();
				scoVo.setSubId(rs.getString("subId"));
				scoVo.setMajor(rs.getString("major"));
				scoVo.setMiddle(rs.getString("middle"));
				scoVo.setSubName(rs.getString("subName"));
				scoVo.setSubScore(rs.getString("subScore"));

				list.add(scoVo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return list;

	}

	public ArrayList<MisVO> readFormMisSum(String stuId) {

		ArrayList<MisVO> misSum = new ArrayList<MisVO>();

		Connection conn = getConnection();
		PreparedStatement st;
		ResultSet rs = null;
		String sql = "SELECT stu.stuId"
				+ "			,SUM(sub.subScore)"
				+ "		FROM tbl_sub sub"
				+ "			,tbl_stu stu"
				+ "			,tbl_score sco"
				+ "	   WHERE sco.stuId = stu.stuId"
				+ "		 AND sco.subId = sub.subId"
				+ "		 AND stu.stuId = '" + stuId + "'"
				+ "		 AND sub.subName LIKE '%MIS%'"
				+ " GROUP BY stu.stuId";

		try {
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();

			while (rs.next()) {
				MisVO misVo = new MisVO();
				misVo.setStuId(rs.getString(1));
				misVo.setScoreSum(rs.getString(2));

				misSum.add(misVo);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return misSum;
	}

}
