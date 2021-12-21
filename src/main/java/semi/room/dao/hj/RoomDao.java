package semi.room.dao.hj;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
	//객실 추가, 리스트, 수정
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
			pstmt.setString(5, vo.getSrc_name());
			pstmt.setDouble(6, vo.getRate());
			return pstmt.executeUpdate();
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
}
