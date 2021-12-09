package semi.member.dao.je;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.JdbcUtil;

public class HloginDaoje {
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
		String id=null;
		try {
			String sql="select id from hlogin where jnum=?";
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, jnum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				id=rs.getString(1);
			}
			return id;
			
		}catch(SQLException s) {
			s.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con,pstmt,rs);
		}
	}

}
