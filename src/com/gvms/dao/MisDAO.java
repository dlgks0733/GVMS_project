package com.gvms.dao;

/**
 * 
 * @author OSJ
 *
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.gvms.vo.MisVO;

public class MisDAO extends CommonDao {

	private static MisDAO instance;

	// MisDAO 객체 리턴하는 메소드 [싱글턴]
	public static MisDAO getInstance() {
		if (instance == null) {
			instance = new MisDAO();
		}
		return instance;
	}

	// MisList.jsp에서 학생별 MIS 총합 점수를 조회하는 메소드
	public List<MisVO> selectMis() {
		
		String sql = "SELECT stu.stuId   as stuId"
				+ "		   , stu.stuName as stuName"
				+ "        , count(sub.subId) * sub.subScore as scoreSum "
				+ "     FROM TBL_SCORE s, TBL_SUB sub, TBL_STU stu "
				+ "    WHERE s.STUID = stu.STUID "
				+ "      AND s.SUBID = sub.SUBID "
				+ "      AND sub.SUBNAME = 'MIS-DAY' "
				+ "      AND stu.STUSTAT = '재학' "
				+ " GROUP BY stu.STUID, stu.STUNAME, sub.SUBID, sub.SUBSCORE"
				+ " ORDER BY STUID";

		List<MisVO> list = new ArrayList<MisVO>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				MisVO mVo = new MisVO();

				mVo.setStuId(rs.getString("stuId"));
				mVo.setStuName(rs.getString("stuName"));
				mVo.setScoreSum(rs.getString("scoreSum"));

				list.add(mVo);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			dbClose();
			
		}
		
		return list;
	}
	
	// MisWrite.jsp에서 학생별 MIS 총합 점수를 조회하는 메소드
		public List<MisVO> selectMisWrite() {
			
			String sql = "SELECT stu.stuid   as stuId"
					+ "		   , stu.stuname as stuName"
					+ "     FROM TBL_STU stu "
					+ "    WHERE stu.stustat = '재학' "
					+ "    ORDER BY STUID";

			List<MisVO> list = new ArrayList<MisVO>();
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;

			try {
				conn = getConnection();
				stmt = conn.prepareStatement(sql);
				rs = stmt.executeQuery(sql);

				while (rs.next()) {
					MisVO mVo = new MisVO();

					mVo.setStuId(rs.getString("stuId"));
					mVo.setStuName(rs.getString("stuName"));

					list.add(mVo);
				}
				
			} catch (SQLException e) {
				
				e.printStackTrace();
				
			} finally {
				
				dbClose();
				
			}
			
			return list;
		}

		// MisView.jsp에서 학생 ScoreDate 조회하는 메소드
		public List<MisVO> selectMisScoreDate(String stuName) {
			
			String sql = "SELECT SCOREDATE"
					+ "		FROM TBL_SCORE"
					+ "	   WHERE STUID ='" + stuName + "'";
			
			
			List<MisVO> list = new ArrayList<MisVO>();
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			try {
				conn = getConnection();
				stmt = conn.prepareStatement(sql);
				rs = stmt.executeQuery(sql);
				
				while (rs.next()) {
					MisVO mVo = new MisVO();
					
					mVo.setScoreDate(rs.getString("scoreDate"));
					
					list.add(mVo);
				}
				
			} catch (SQLException e) {
				
				e.printStackTrace();
				
			} finally {
				
				dbClose();
				
			}
			
			return list;
		}
	
	// MIS 등록하는 메소드
	public void insertMis(MisVO misVo) {
		
		String sql = "INSERT INTO TBL_SCORE(scoreid"
				+ "                   , subid"
				+ "                   , stuid"
				+ "                   , scoredate"
				+ "                   , acqscore)"
				+ "   VALUES(score_seq.nextval, 1, ?, ?, null)";

		Connection conn = null;
		PreparedStatement st = null;

		try {
			conn = getConnection();
			st = conn.prepareStatement(sql);

			st.setString(1, misVo.getStuId());
			st.setString(2, misVo.getScoreDate());

			st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}
	
}
