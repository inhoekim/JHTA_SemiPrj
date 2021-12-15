package semi.room.dao.ihk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;

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
}
