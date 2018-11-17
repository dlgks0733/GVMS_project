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
		String sql = "SELECT * FROM TBL_STU ORDER BY STU_ID DESC";
		
		try {
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();
			
			while(rs.next()) {
				StudentVO stuVo = new StudentVO();
				stuVo.setStu_id(rs.getString("stu_id"));
				stuVo.setStu_name(rs.getString("stu_name"));
				stuVo.setStu_stat(rs.getString("stu_stat"));
				stuVo.setStu_index(rs.getString("stu_index"));
				
				list.add(stuVo);
				
			}
			
		}	catch(SQLException e) {
			e.printStackTrace();
		}	finally {
			dbClose();
		}
		return list;
	}
	
	// 학생 , 총점 목록 가져오기
	public ArrayList<StudentVO> StudentTotalList() {
		
		ArrayList<StudentVO> list = new ArrayList<StudentVO>();
		
		Connection conn = getConnection();
		PreparedStatement st;
		ResultSet rs = null;
		String sql = "SELECT STU.STU_ID, STU.STU_NAME, ST.TOTAL FROM SCORETOTAL ST, TBL_STU STU" + 
					" WHERE ST.STU_ID = STU.STU_ID";
		
		try {
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();
			
			while(rs.next()) {
				StudentVO stuVo = new StudentVO();
				stuVo.setStu_id(rs.getString("stu_id"));
				stuVo.setStu_name(rs.getString("stu_name"));
				stuVo.setScore_total(rs.getString("total"));
				
				list.add(stuVo);
				
			}
			
		}	catch(SQLException e) {
			e.printStackTrace();
		}	finally {
			dbClose();
		}
		return list;
	}

}
