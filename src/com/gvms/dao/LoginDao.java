//로그인 DAO
package com.gvms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.gvms.vo.AdminVO;

public class LoginDao extends CommonDao {

	private static LoginDao instance = new LoginDao();

   public static LoginDao getInstance() {
      if (instance == null) {
         instance = new LoginDao();
      }
      return instance;
   }
   
//db connection
/*   public Connection getConnection() throws Exception {
	      Connection conn = null;
	      Context initContext = new InitialContext();
	      Context envContext = (Context) initContext.lookup("java:/comp/env");
	      DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle");
	      conn = ds.getConnection();

	      return conn;
	   }*/
   //관리자 인증시 사용 메소드
   public int adminCheck(String userid, String pwd) {
	      int result = -1;
	      String sql = "select adminpw from admin where adminid = ?";
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         conn = getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, userid);
	         rs = pstmt.executeQuery();

	         if (rs.next()) {
	            if (rs.getString("adminpw") != null && rs.getString("adminpw").equals(pwd)) {
	               result = 1;
	            } else {
	               result = 0;
	            }
	         } else {
	            result = -1;
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         try {
	            if (rs != null)
	               rs.close();
	            if (pstmt != null)
	               pstmt.close();
	            if (conn != null)
	               conn.close();
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	      }
	      return result;
	   }

   
// 아이디로 회원정보 가져오는 메소드
   public AdminVO getMember(String userid) {
      AdminVO mVo = null;
      String sql = "select * from admin where adminid = ?";
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         conn = getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, userid);
         rs = pstmt.executeQuery();
         if (rs.next()) {
            mVo = new AdminVO();

            

            
            /*
            		      이름      널?       유형           
            		------- -------- ------------ 
            		ADMINID NOT NULL VARCHAR2(10) 
            		ADMINPW NOT NULL VARCHAR2(20) 
            		ADNAME  NOT NULL VARCHAR2(20) */
            
        
            mVo.setAdminId(rs.getString("AdminId"));
            mVo.setAdminPw(rs.getString("AdminPw"));
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if (rs != null)
               rs.close();
            if (pstmt != null)
               pstmt.close();
            if (conn != null)
               conn.close();
         } catch (Exception e) {
            e.printStackTrace();
         }
      }

      return mVo;
   }

   
      //관리자 등록(확장성)
   public int insertBoardUser(AdminVO mVo) {
	      int result = -1;
	      String sql = "insert into admin (adminid,adminpw,adname)"
	            + " values(?,?,?)";
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      try {
	         conn = getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, mVo.getAdminId());
	         pstmt.setString(2, mVo.getAdminPw());
	         result = pstmt.executeUpdate();
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return result;
	   }
   public int confirmID(String userid) {

	      int result = -1;
	      String sql = "select adminid from admin where adminid = ?";
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;

	      try {
	         conn = getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, userid);
	         rs = pstmt.executeQuery();
	         if (rs.next()) {
	            result = 1;
	         } else {
	            result = -1;
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         try {
	            if (rs != null)
	               rs.close();
	            if (pstmt != null)
	               pstmt.close();
	            if (conn != null)
	               conn.close();
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	      }
	      return result;
	   }

}