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
