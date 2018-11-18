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
		String sql = "SELECT * FROM TBL_STU ORDER BY STUID DESC";
		
		try {
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();
			
			while(rs.next()) {
				StudentVO stuVo = new StudentVO();
				stuVo.setStuId(rs.getString("stuId"));
				stuVo.setStuName(rs.getString("stuName"));
				stuVo.setStuStat(rs.getString("stuStat"));
				stuVo.setStuIndex(rs.getString("stuIndex"));
				
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
		String sql = "SELECT STU.STUID, STU.STUNAME, ST.TOTAL FROM SCORETOTAL ST, TBL_STU STU" + 
					" WHERE ST.STUID = STU.STUID";
		
		try {
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();
			
			while(rs.next()) {
				StudentVO stuVo = new StudentVO();
				stuVo.setStuId(rs.getString("stuId"));
				stuVo.setStuName(rs.getString("stuName"));
				stuVo.setScoreTotal(rs.getString("total"));
				
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
