package com.gvms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.gvms.vo.StudentVO;
import com.gvms.vo.SubjectVO;

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
	
	// 학생 , 총점 목록 가져오기, 학생 수정
	public ArrayList<StudentVO> StudentTotalList() {
		
		ArrayList<StudentVO> list = new ArrayList<StudentVO>();
		
		Connection conn = getConnection();
		PreparedStatement st;
		ResultSet rs = null;
		String sql = "SELECT STU.STUID, STU.STUNAME, ST.TOTAL FROM SCORETOTAL ST, TBL_STU STU" + 
					 "WHERE ST.STUID = STU.STUID";
		
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
	

	public void insertStudent(StudentVO stuVo) {
		String sql = "insert into TBL_STU(stuID"
				+ "						, stuName"
				+ "						, stuStat"
				+ "						, stuIndex)"
				+ "	  values(?, ?, ?, STU_SEQ.nextval)";
		
		Connection conn = null;
		PreparedStatement st = null;
		
		try {
			conn= getConnection();
			st = conn.prepareStatement(sql);
			
			st.setString(1, stuVo.getStuId());
			st.setString(2, stuVo.getStuName());
			st.setString(3, stuVo.getStuStat());
			
			st.executeUpdate();
			
		}catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			dbClose();
		}
	}
	

	public ArrayList<StudentVO> getStudentList()
	{
		ArrayList<StudentVO> studentList = new ArrayList<StudentVO>();
		String sql = "select * from TBL_STU";
		
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		
		try {
			conn= getConnection();
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();
			
		
		        
	while(rs.next())
	{
		StudentVO stuVo = new StudentVO();
		stuVo.setStuId(rs.getString("stuID"));
		stuVo.setStuName(rs.getString("stuName"));
		stuVo.setStuStat(rs.getString("stuStat"));
		stuVo.setStuIndex(rs.getString("stuIndex"));
		studentList.add(stuVo);
		
	}
	
	}catch (SQLException e) {
		e.printStackTrace();
	}finally {
		dbClose();
	}
		return studentList;
	}
	
		  public void updateStudent (StudentVO stuVo) {
			   
			   String sql = "update TBL_STU set StuName = ?"
			   		+ "                       , StuStat = ? "
			   		+ "       where StuID = ?";
			   Connection conn = getConnection();
			   PreparedStatement st;
			   
			   
			   try {

				   st = conn.prepareStatement(sql);
				   
				   st.setString(1, stuVo.getStuId());
				   st.setString(2, stuVo.getStuName());
			       st.setString(3, stuVo.getStuStat());

			       st.executeUpdate();
			       
			   }catch (SQLException e){
				   e.printStackTrace();
			   }finally {
				   dbClose();
			   }
		   }
		  
		  
		   public void deleteStudent(StudentVO stuVo) {
			   
			   String sql = "delete FROM TBL_STU where stuID = ?";
			   Connection conn = getConnection();
			   PreparedStatement st;

			   try {

				   st = conn.prepareStatement(sql);
				   
				   st.setString(1, stuVo.getStuId());
				   st.executeUpdate(); 
			   }catch(SQLException e){
				   e.printStackTrace();
			   }finally {
				   dbClose();
			   }
			
		   }
		
	

		
	
	
	
}

		
	

