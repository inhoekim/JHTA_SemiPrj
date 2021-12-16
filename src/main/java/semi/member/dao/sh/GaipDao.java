package semi.member.dao.sh;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
	public GaipVo selecthloginid(String hlogin_id){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getCon();
			String sql="select * from hlogin where hlogin_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, hlogin_id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String pwd=rs.getString("pwd");
				String name=rs.getString("name");
				String jnum=rs.getString("jnum");
				int age=rs.getInt("age");
				String area=rs.getString("area");
				
				GaipVo gaipVo=new GaipVo(hlogin_id,pwd,name,jnum,age,area,null,1);
				return gaipVo;
			}
			return null;
		}catch(SQLException s) {
			s.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	public int updateid(GaipVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getCon();
			String sql="update hlogin set pwd=?,name=?,jnum=?,age=?,area=? where hlogin_id=?";
			pstmt=con.prepareStatement(sql);		
			pstmt.setString(1,vo.getPwd());
			pstmt.setString(2,vo.getName());
			pstmt.setString(3,vo.getJnum());
			pstmt.setInt(4,vo.getAge());
			pstmt.setString(5,vo.getArea());
			pstmt.setString(6,vo.getHlogin_id());
			
			return pstmt.executeUpdate(); // 실패 하면 0 , 성공하면 1 뱉어냄
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	public ArrayList<GaipVo> AdminselectAll(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getCon();
			String sql="select * from hlogin";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			ArrayList<GaipVo> list=new ArrayList<GaipVo>();
			while(rs.next()) {
				String hlogin_id=rs.getString("hlogin_id");
				String pwd=rs.getString("pwd");
				String name=rs.getString("name");
				String jnum=rs.getString("jnum");
				int age=rs.getInt("age");
				String area=rs.getString("area");
				Date regdate=rs.getDate("regdate");
				int num=rs.getInt("num");
				GaipVo gaipVo=new GaipVo(hlogin_id, pwd, name, jnum, age, area, regdate, num);
				list.add(gaipVo);
			}
			return list;
		}catch(SQLException s) {
			s.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	public int admindelete(String hlogin_id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getCon();
			String sql="delete from hlogin where hlogin_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,hlogin_id);
			return pstmt.executeUpdate();
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	public int adminupdate(GaipVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getCon();
			String sql="update hlogin set pwd=?,name=?,jnum=?,age=?,area=?,regdate=?,num=?, where id=?";
			pstmt=con.prepareStatement(sql);		
			pstmt.setString(1,vo.getPwd());
			pstmt.setString(2,vo.getName());
			pstmt.setString(3,vo.getJnum());
			pstmt.setInt(4,vo.getAge());
			pstmt.setString(5,vo.getArea());
			pstmt.setDate(6,vo.getRegdate());
			pstmt.setInt(7,vo.getNum());
			pstmt.setString(8,vo.getHlogin_id());
			return pstmt.executeUpdate();
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	
}
	public GaipVo adminselect(String hlogin_id){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getCon();
			String sql="select * from hlogin where hlogin_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, hlogin_id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String pwd=rs.getString("pwd");
				String name=rs.getString("name");
				String jnum=rs.getString("jnum");
				int age=rs.getInt("age");
				String area=rs.getString("area");
				
				GaipVo gaipVo=new GaipVo(hlogin_id,pwd,name,jnum,age,area,null,1);
				return gaipVo;
			}
			return null;
		}catch(SQLException s) {
			s.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
}