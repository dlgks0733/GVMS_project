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
		//MIS 점수 조회화면에는 학번과 이름, MIS총점을 출력해야 한다.
		//학생은 재학상태인 학생만 출력한다.
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
	
	public List<MisVO> selectMisModify() {
		//MIS 점수 조회화면에는 학번과 이름, MIS총점을 출력해야 한다.
		//학생은 재학상태인 학생만 출력한다.
		String sql = "SELECT s.scoreId 	 as scoreId"
				+ "		   , stu.stuId   as stuId"
				+ "		   , stu.stuName as stuName"
				+ "        , TO_CHAR(s.scoreDate, 'YYYY-MM-DD') as scoreDate "
				+ "     FROM TBL_SCORE s, TBL_STU stu "
				+ "    WHERE s.STUID = stu.STUID "
				+ " ORDER BY s.scoreDate DESC";

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
				
				mVo.setScoreId(rs.getString("scoreId"));
				mVo.setStuId(rs.getString("stuId"));
				mVo.setStuName(rs.getString("stuName"));
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
	
	// MisWrite.jsp에서 학생별 MIS 총합 점수를 조회하는 메소드
		public List<MisVO> selectMisRegist() {
			//MIS 등록화면은 학번과 이름을 보고 체크박스와 날짜 입력폼으로 MIS-DAY의 출결을 등록을 한다.
			//따라서 등록 첫 화면으로 학번과 이름이 출력돼야 한다.
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

		// MisRead.jsp에서 학생 ScoreDate 조회하는 메소드
		public List<MisVO> selectMisScoreDate(String stuName) {
			// 상세조회 페이지로 선택한 학생의 학번과 이름 MIS-DAY 총점을 출력하고
			// MIS-DAY 출석한 날짜를 최근순으로 출력한다
			String sql = "SELECT TO_CHAR(scoreDate,'YYYY-MM-DD') AS scoreDate"
					+ "			,sco.SCOREID  as scoreId"
					+ "			,sub.SUBSCORE as subScore"
					+ "		FROM TBL_SCORE sco"
					+ "         ,TBL_STU stu"
					+ "			,TBL_SUB sub"
					+ "    WHERE sco.STUID = stu.STUID"
					+ "		 AND sco.SUBID = sub.SUBID"
					+ " 	 AND sub.SUBNAME = 'MIS-DAY'"
					+ "	     AND stu.STUNAME ='" + stuName + "'"
					+ "    ORDER BY sco.scoreDate DESC";
			
			
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
					
					/*mVo.setScoreDate(rs.getString("stuId"));
					mVo.setScoreDate(rs.getString("stuName"));*/
					mVo.setScoreId(rs.getString("scoreId"));
					mVo.setScoreDate(rs.getString("scoreDate"));
					mVo.setSubScore(rs.getString("subScore"));
					list.add(mVo);
				}
				
			} catch (SQLException e) {
				
				e.printStackTrace();
				
			} finally {
				
				dbClose();
				
			}
			
			return list;
		}
		
		// MisRead.jsp에서 학생 ScoreDate 조회하는 메소드
				public List<MisVO> selectMisScoreSum(String stuName) {
					// 상세조회 페이지로 선택한 학생의 학번과 이름 MIS-DAY 총점을 출력하고
					// MIS-DAY 출석한 날짜를 최근순으로 출력한다
					String sql = "SELECT stu.stuId"
							+ "			,stu.stuName"
							+ "			,ss.scoreSum"
							+ "		FROM TBL_STU stu"
							+ "			,SCORESUM ss"
							+ "    WHERE stu.STUID = ss.STUID"
							+ "		 AND stu.STUNAME ='" + stuName + "'";
					
					
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
							mVo.setScoreSum(rs.getString("ScoreSum"));
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
		//MIS-DAY 출결을 등록하는 쿼리문
		//MIS-DAY 점수는 TBL_SCORE 테이블에 존재하며 SUBID로 반드시 1을 갖는다.
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
	
	 public void modifyMis (MisVO misVo) {
		   
		   String sql = "UPDATE TBL_SCORE SET scoreDate =? WHERE scoreId = ?";
		   
		   Connection conn = getConnection();
		   PreparedStatement st;
		   
		   
		   try {

			   st = conn.prepareStatement(sql);
			   
			   st.setString(1, misVo.getScoreDate());
			   st.setString(2, misVo.getScoreId());
		       st.executeUpdate();
		       
		   }catch (SQLException e){
			   e.printStackTrace();
		   }finally {
			   dbClose();
		   }
	   }

	public void deleteMis(MisVO misVo) {
		
		String sql = "DELETE TBL_SCORE"
				+ "	   WHERE SCOREID = ?";
		
		Connection conn = null;
		PreparedStatement st = null;
		
		try {
			conn = getConnection();
			st = conn.prepareStatement(sql);

			st.setString(1, misVo.getScoreId());

			st.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}
	
}
