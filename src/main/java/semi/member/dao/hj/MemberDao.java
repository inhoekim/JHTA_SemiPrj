package semi.member.dao.hj;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import db.JdbcUtil;
import semi.member.Vo.je.HloginVoje;


public class MemberDao {
	public boolean isMember(HashMap<String, String> map) {
		String id=map.get("hlogin_id");
		String pwd=map.get("pwd");
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getCon();
			String sql="select * from hlogin where hlogin_id=? and pwd=? and num=1";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
			return false;
		}catch(SQLException s) {
			s.printStackTrace();
			return false;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	public HloginVoje selectpwd (String hlogin_id, String jnum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getCon();
			String sql="select * from hlogin where hlogin_id=? and jnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, hlogin_id);
			pstmt.setString(2, jnum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String pwd=rs.getString("pwd");
				String name=rs.getString("name");
				int age=rs.getInt("age");
				String area=rs.getString("area");
				Date regdate=rs.getDate("regdate");
				int num=rs.getInt("num");
				HloginVoje vo=new HloginVoje(hlogin_id, pwd, name, jnum, age, area, regdate, num);
				return vo;
			}
			return null;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally{
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	public int changepwd(HloginVoje vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="update hlogin set pwd=? where hlogin_id=?";
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getPwd());
			pstmt.setString(2, vo.getHlogin_id());
			return pstmt.executeUpdate();
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
}
