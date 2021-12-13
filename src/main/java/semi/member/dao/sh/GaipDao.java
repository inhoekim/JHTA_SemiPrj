package semi.member.dao.sh;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import db.JdbcUtil;
import semi.member.Vo.sh.GaipVo;


public class GaipDao {
	public int insert(GaipVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getCon();
			String sql="insert into hlogin values(?,?,?,?,?,?,sysdate,1)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,vo.getHlogin_id());
			pstmt.setString(2,vo.getPwd());
			pstmt.setString(3,vo.getName());
			pstmt.setString(4,vo.getJnum());
			pstmt.setInt(5,vo.getAge());
			pstmt.setString(6,vo.getArea());
			
			return pstmt.executeUpdate();
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	public int idChk(String hlogin_id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getCon();
			String sql="select * from hlogin where hlogin_id= ? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,hlogin_id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				return 1; //존재하는회원
			}else {
				return 0; //가입가능한회원
			}
			
		}catch(SQLException s) {
			s.printStackTrace();
			
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt !=null) pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			JdbcUtil.close(con, pstmt, null);
		}
		return -1; //데이터베이스 오류
	}
}