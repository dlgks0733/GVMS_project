package com.gvms.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.gvms.vo.StudentVO;

public class StudentDao extends CommonDao {

	private static StudentDao instance;

	public static StudentDao getInstance() {
		if (instance == null) {
			instance = new StudentDao();
		}
		return instance;
	}

	// 학생 목록 가져오기
	public ArrayList<StudentVO> StudentList() {

		ArrayList<StudentVO> list = new ArrayList<StudentVO>();

		Connection conn = getConnection();
		PreparedStatement st;
		ResultSet rs = null;
		String sql = "SELECT * FROM TBL_STU ORDER BY stuIndex DESC";

		try {
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();

			while (rs.next()) {
				StudentVO stuVo = new StudentVO();
				stuVo.setStuId(rs.getString("stuId"));
				stuVo.setStuName(rs.getString("stuName"));
				stuVo.setStuStat(rs.getString("stuStat"));
				stuVo.setStuIndex(rs.getString("stuIndex"));

				list.add(stuVo);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return list;
	}

	// 학생 , 총점 목록 가져오기, 학생 수정
	public ArrayList<StudentVO> StudentTotalList() {

		ArrayList<StudentVO> list = new ArrayList<StudentVO>();

		Connection conn = getConnection();
		PreparedStatement st;
		ResultSet rs = null;
		String sql = "SELECT STU.STUID, STU.STUNAME, ST.TOTAL FROM SCORETOTAL ST, TBL_STU STU "
				+ "WHERE ST.STUID = STU.STUID ORDER BY STU.STUID DESC";

		try {
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();

			while (rs.next()) {
				StudentVO stuVo = new StudentVO();
				stuVo.setStuId(rs.getString("stuId"));
				stuVo.setStuName(rs.getString("stuName"));
				stuVo.setScoreTotal(rs.getString("total"));

				list.add(stuVo);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return list;
	}

	public void insertStudent(StudentVO stuVo) {
		String sql = "insert into TBL_STU(stuID" + "						, stuName"
				+ "						, stuStat" + "						, stuIndex)"
				+ "	  values(?, ?, ?, TO_CHAR(stu_seq.nextval, '0000'))";

		Connection conn = null;
		PreparedStatement st = null;

		try {
			conn = getConnection();
			st = conn.prepareStatement(sql);

			st.setString(1, stuVo.getStuId());
			st.setString(2, stuVo.getStuName());
			st.setString(3, stuVo.getStuStat());

			st.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			dbClose();
		}
	}

	public ArrayList<StudentVO> getStudentList() {
		ArrayList<StudentVO> studentList = new ArrayList<StudentVO>();
		String sql = "select * from TBL_STU ORDER BY stuIndex DESC";

		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();

			while (rs.next()) {
				StudentVO stuVo = new StudentVO();
				stuVo.setStuId(rs.getString("stuID"));
				stuVo.setStuName(rs.getString("stuName"));
				stuVo.setStuStat(rs.getString("stuStat"));
				stuVo.setStuIndex(rs.getString("stuIndex"));
				studentList.add(stuVo);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return studentList;
	}

	public void updateStudent(StudentVO stuVo) {

		String sql = "update TBL_STU set StuName = ?" + "                       , StuStat = ? "
				+ "       where StuID = ?";
		Connection conn = getConnection();
		PreparedStatement st;

		try {

			st = conn.prepareStatement(sql);

			st.setString(1, stuVo.getStuName());
			st.setString(2, stuVo.getStuStat());
			st.setString(3, stuVo.getStuId());

			st.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}

	public void deleteStudent(String stuId) {

		String sql = "delete FROM TBL_STU where stuId = ? ";
		Connection conn = null;
		PreparedStatement st;

		try {

			conn = getConnection();
			st = conn.prepareStatement(sql);

			st.setString(1, stuId);
			st.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}

	}

	public int confirmStuId(String stuId) {

		int result = -1;
		String sql = "SELECT stuid "
				   + "	FROM TBL_STU "
				   + " WHERE stuid = ?";
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			conn = getConnection();

			st = conn.prepareStatement(sql);

			st.setString(1, stuId);

			rs = st.executeQuery();

			if (stuId.equals("")) {
				// 데이터 NULL
				result = 0;

			} else if (rs.next()) {
				// 데이터 존재.
				result = 1;
				System.out.println(result + ":통과");

			} else {
				// 데이터 없음.
				result = -1;
			}
		} // 데이터 없음.
		catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return result;
	}

}
