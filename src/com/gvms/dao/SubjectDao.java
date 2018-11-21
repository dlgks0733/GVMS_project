package com.gvms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.gvms.vo.SubjectVO;

public class SubjectDao extends CommonDao {

	private SubjectDao() {
		
	}
	
	private static SubjectDao instance;
	
	public static SubjectDao getInstance() {
		if(instance == null) {
			instance = new SubjectDao();
		}
		return instance;
	}
	
	public ArrayList<SubjectVO> SearchSubject(String subName) {
		
		ArrayList<SubjectVO> list = new ArrayList<SubjectVO>();
		
		String sql = "SELECT * FROM TBL_SUB WHERE SUBNAME LIKE  '%" + subName + "%'";
		
		
		Connection conn = getConnection();
		PreparedStatement st;
		ResultSet rs = null;
		
		try {
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();
			
			if(rs.next()) {
			SubjectVO subVo = new SubjectVO();
			subVo.setSubId(rs.getString("subId"));
			subVo.setMajor(rs.getString("major"));
			subVo.setMiddle(rs.getString("middle"));
			subVo.setSubName(rs.getString("subName"));
			subVo.setSubScore(rs.getString("subScore"));
			
			list.add(subVo);
			}
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return list;
		
	}
	 public ArrayList<SubjectVO> selectsubList(String subId) {
		   String sql = "select * from TBL_SUB where subId ="+ subId +"";
		   ArrayList<SubjectVO> list = new ArrayList <SubjectVO>();
		   Connection conn = getConnection();
		   PreparedStatement st;
		   ResultSet rs = null;
		   
		   try {
			   st = conn.prepareStatement(sql);
			   rs = st.executeQuery();
			   
			   while (rs.next()) {
	 			   SubjectVO subVO = new SubjectVO();   // subjectVO subVO = null;
				   
	 			   
	 			   subVO.setSubId(rs.getString("subId"));
	 			   subVO.setMajor(rs.getString("major"));
	 			   subVO.setMiddle(rs.getString("middle"));
	 			   subVO.setSubName(rs.getString("subName"));
	 			   subVO.setSubScore(rs.getString("subScore"));

	 			   list.add(subVO);
			   }
		   } catch (SQLException e) {
			   e.printStackTrace();
		   } finally {
			   dbClose();
		   }
		   return list ;

	   }
	
	 public ArrayList<SubjectVO> selectAllList() {
		   String sql = "select * from TBL_SUB order by subId";
		   ArrayList<SubjectVO> list = new ArrayList <SubjectVO>();
		   Connection conn = getConnection();
		   PreparedStatement st;
		   ResultSet rs = null;
		   
		   try {
			   st = conn.prepareStatement(sql);
			   rs = st.executeQuery();
			   
			   while (rs.next()) {
	 			   SubjectVO subVO = new SubjectVO();   // subjectVO subVO = null;
				   
	 			   
	 			   subVO.setSubId(rs.getString("subId"));
	 			   subVO.setMajor(rs.getString("major"));
	 			   subVO.setMiddle(rs.getString("middle"));
	 			   subVO.setSubName(rs.getString("subName"));
	 			   subVO.setSubScore(rs.getString("subScore"));

	 			   list.add(subVO);
			   }
		   } catch (SQLException e) {
			   e.printStackTrace();
		   } finally {
			   dbClose();
		   }
		   return list ;

	   }
	   public void insertsubject(SubjectVO subVO) {
		     
	      String sql = "insert into TBL_SUB(" + "subId, major, middle, subName, subScore)" 
	    		  	+ "values(SUB_SEQ.nextval, ?, ?, ?, ?)";
	      Connection conn = getConnection();
	      PreparedStatement st;
	      

	      try {

	    	 st = conn.prepareStatement(sql);
	    	 
	         st.setString(1, subVO.getMajor());
	         st.setString(2, subVO.getMiddle());
	         st.setString(3, subVO.getSubName());
	         st.setString(4, subVO.getSubScore());
	         st.executeUpdate(); 
	   }catch (SQLException e){
		   e.printStackTrace();
	   }finally {
		   dbClose();
	   }

	  
	}
	   public void updatesubject (SubjectVO subVO) {
		   
		   String sql = "update TBL_SUB set major = ?, middle = ?, subName = ?, subScore = ?  where subId = ?";
		   Connection conn = getConnection();
		   PreparedStatement st;
		   
		   
		   try {

			   st = conn.prepareStatement(sql);
			   
			   st.setString(1, subVO.getMajor());
			   st.setString(2, subVO.getMiddle());
		       st.setString(3, subVO.getSubName());
		       st.setString(4, subVO.getSubScore());
		       st.setString(5, subVO.getSubId());
		       st.executeUpdate();
		       
		   }catch (SQLException e){
			   e.printStackTrace();
		   }finally {
			   dbClose();
		   }
	   }
	   public void deletesubject(SubjectVO subVO) {
		   
		   String sql = "delete TBL_SUB where subId = ?";
		   Connection conn = getConnection();
		   PreparedStatement st;

		   try {

			   st = conn.prepareStatement(sql);
			   
			   st.setString(1, subVO.getSubId());
			   st.executeUpdate(); 
		   }catch(SQLException e){
			   e.printStackTrace();
		   }finally {
			   dbClose();
		   }
		
	   }
	
}
