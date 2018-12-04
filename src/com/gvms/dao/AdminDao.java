//로그인 DAO
package com.gvms.dao;

import java.sql.Connection;
import java.sql.ResultSet;

import java.sql.SQLException;
import java.sql.Statement;

import com.gvms.vo.AdminVO;

public class AdminDao extends CommonDao {

	private static AdminDao instance = new AdminDao();

	public static AdminDao getInstance() {
		if (instance == null) {
			instance = new AdminDao();
		}
		return instance;
	}

	public int loginCheck(AdminVO aVo) {

		String sql = "SELECT adminId, adminPw " 
				   + "     FROM tbl_admin " 
				   + "    WHERE adminId = '" 
				   + aVo.getAdminId() 
				   + "'";

		System.out.println(aVo.getAdminPw());
		System.out.println(aVo.getAdminId());

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				System.out.println(rs.getString("adminId"));
				if (rs.getString("adminPw") != null && rs.getString("adminPw").equals(aVo.getAdminPw())) {
					return 1; // 로그인 성공
				} else {
					return 0; // 로그인 실패
				}
			} else {

				return -1;

			}
		} catch (SQLException e) {

			e.printStackTrace();

		} finally {

			dbClose();

		}

		return -1;
	}

	public AdminVO getAdminInfo(AdminVO tempVo) {

		String sql = "SELECT adminId " 
			       + "  FROM tbl_admin " 
				   + " WHERE adminId = '" + tempVo.getAdminId() + "'";

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		AdminVO aVo = new AdminVO();

		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				aVo.setAdminId(rs.getString("adminId"));
			}
		} catch (SQLException e) {

			e.printStackTrace();

		} finally {

			dbClose();

		}
		return aVo;
	}

}