package semi.room.dao.hj;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import semi.room.vo.ihk.RoomVo;

public class RoomDao {
	private static RoomDao instance;
	private RoomDao() {}
	public static RoomDao getInstance() {
		if(instance==null) {
			instance=new RoomDao();
		}
		return instance;
	}
	public int insertRoom(RoomVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getCon();
			String sql="insert into room values(?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, vo.getRoom_id());
			pstmt.setString(2, vo.getKind());
			pstmt.setInt(3, vo.getCapacity());
			pstmt.setInt(4, vo.getPrice());
			pstmt.setDouble(5, vo.getRate());
			pstmt.setString(6, vo.getSrc_name());
			return pstmt.executeUpdate();
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	public RoomVo roomselect(int room_id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getCon();
			String sql="select * from room where room_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, room_id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String kind=rs.getString("kind");
				int capcity=rs.getInt("capcity");
				int price=rs.getInt("price");
				Double rate=rs.getDouble("rate");
				String src_name=rs.getString("src_name");
				RoomVo vo=new RoomVo(room_id, kind, capcity, price, rate, src_name);
				return vo;
			}
			return null;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	public ArrayList<RoomVo> roomselectAll(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getCon();
			String sql="select * fron room";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			ArrayList<RoomVo> list=new ArrayList<RoomVo>();
			while(rs.next()) {
				int room_id=rs.getInt("room_id");
				String kind=rs.getString("kind");
				int capcity=rs.getInt("capcity");
				int price=rs.getInt("price");
				String src_name=rs.getString("src_name");
				double rate=rs.getDouble("rate");
				RoomVo vo=new RoomVo(room_id, kind, capcity, price, null, src_name);
				list.add(vo);
			}
			return list;
		}catch(SQLException s){
			s.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	public int roomupdate(RoomVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getCon();
			String sql="update room set kind=?, capcity=?, price=?, src_name=?, rate=? where room_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getKind());
			pstmt.setInt(2, vo.getCapacity());
			pstmt.setInt(3, vo.getPrice());
			pstmt.setString(4, vo.getSrc_name());
			pstmt.setDouble(5, vo.getRate());
			return pstmt.executeUpdate();
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	public int roomdelete(int room_id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getCon();
			String sql="delete from room where room_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, room_id);
			return pstmt.executeUpdate();
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
			
		}
	}
}
