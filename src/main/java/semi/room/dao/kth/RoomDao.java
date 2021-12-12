package semi.room.dao.kth;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.JdbcUtil;

public class RoomDao {
	private static RoomDao instance;
	
	public static RoomDao getInstance() {
		if (instance == null) {
			instance = new RoomDao();
		}
		return instance;
	}
	
	// 리뷰 작성(평점 불러오기)
	public int reviewRate(int room_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = JdbcUtil.getCon();
			String sql = "select rate "
					+ "from room "
					+ "where room_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, room_id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				int rate = rs.getInt("rate");
				return rate;
			}
			return -1;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		} finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	
	// 객실 평점 업데이트
	public int roomRateUpdate(int room_id, double rate) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = JdbcUtil.getCon();
			String sql = "update room "
					+ "set rate = ? "
					+ "where room_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setDouble(1, rate);
			pstmt.setInt(2, room_id);
			int n = pstmt.executeUpdate();
			return n;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		} finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
}
