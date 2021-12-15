package semi.room.dao.ihk;

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
		if (instance == null) {
			instance = new RoomDao();
		}
		return instance;
	}
	//capacity에 해당하는 room_id 가져오기
	public ArrayList<Integer> capaciousRoom(int capacity){
		ArrayList<Integer> rooms = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "Select room_id from room where capacity = ?";
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, capacity);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				rooms.add(rs.getInt("room_id"));
			}
			return rooms;
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con,pstmt,rs);
		}
	}
	
	public RoomVo selectRoom(int room_id){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "Select * from room where room_id = ?";
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, room_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String kind = rs.getString("kind");
				int capacity = rs.getInt("capacity");
				int price = rs.getInt("price");
				Double rate = rs.getDouble("rate");
				return new RoomVo(room_id,kind,capacity,price,rate,null);
			}else return null;
			
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con,pstmt,rs);
		}
	}
}
