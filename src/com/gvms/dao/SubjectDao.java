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
	
	public ArrayList<SubjectVO> SearchSubject(String sub_name) {
		
		ArrayList<SubjectVO> list = new ArrayList<SubjectVO>();
		
		String sql = "SELECT * FROM TBL_SUB WHERE SUB_NAME LIKE  '%" + sub_name + "%'";
		
		
		Connection conn = getConnection();
		PreparedStatement st;
		ResultSet rs = null;
		
		try {
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();
			
			if(rs.next()) {
			SubjectVO subVo = new SubjectVO();
			subVo.setSub_id(rs.getString("sub_id"));
			subVo.setSub_major(rs.getString("sub_major"));
			subVo.setSub_middle(rs.getString("sub_middle"));
			subVo.setSub_name(rs.getString("sub_name"));
			subVo.setSub_score(rs.getString("sub_score"));
			
			list.add(subVo);
			}
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return list;
		
	}
	
	
	
	
	
	
	/*public void insertSubject(SubjectVO subVo) {
		String sql = "INSERT INTO SUBJECT(" +
					 	"subID, major, middle, subName, subScore)" +
					 	"VALUES (subID.nextval, ?, ?, ?, ?)";
		
		Connection conn = getConnection();
		PreparedStatement st;
		
		try {
			st = conn.prepareStatement(sql);
			st.setString(1, subVo.getMajor());
			st.setString(2, subVo.getMiddle());
			st.setString(3, subVo.getSubName());
			st.setInt(4, subVo.getSubScore());
			
			st.executeUpdate();
		}	catch(SQLException e) {
			e.printStackTrace();
		}	finally {
			dbClose();
		}
				
	}
*/	
	
}
