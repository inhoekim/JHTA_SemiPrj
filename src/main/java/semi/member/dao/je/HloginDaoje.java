package semi.member.dao.je;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.JdbcUtil;
import oracle.jdbc.proxy.annotation.Pre;

public class HloginDaoje {
	
	public boolean Adminlogin(String admin_id,String pwd) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			String sql="select * from admin where admin_id=? and pwd=?";
			con=db.JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, admin_id);
			pstmt.setString(2, pwd);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
			
		}catch(SQLException s) {
			s.printStackTrace();
			return false;
		}finally {
			JdbcUtil.close(con,pstmt,null);
		}
		return false;
		
	}

	public int update(String pwd,String jnum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			String sql="update hlogin set num=2 where pwd=? and jnum=?";
			con=db.JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, jnum);
			int n=pstmt.executeUpdate();
			return n;
			
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			db.JdbcUtil.close(con,pstmt,rs);
		}
	}
	public String select(String jnum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String hlogin_id=null;
		try {
			String sql="select hlogin_id from hlogin where jnum=?";
			con=db.JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, jnum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				hlogin_id=rs.getString(1); 
			}
			return hlogin_id;
			
		}catch(SQLException s) {
			s.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con,pstmt,rs);
		}
	}

}
