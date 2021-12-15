package semi.reserve.dao.ihk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import db.JdbcUtil;


public class ReserveDao {

	private static ReserveDao reserveDao = new ReserveDao();
	
	private ReserveDao() {}
	
	public static ReserveDao getInstance() {
		return reserveDao;
	}
	//매개변수로 전해받은 방번호에 대한 모든 예약내역을 HashMap에 담아서 리턴
	public HashMap<Integer,ArrayList<String>> getReserve(ArrayList<Integer> rooms){
		HashMap<Integer,ArrayList<String>> reservations = new HashMap<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql= "";
		try {
			con = JdbcUtil.getCon();
			for(int room : rooms) {
				sql = "select * from reserve where room_id = ? and (statement = 1 or statement = 2)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, room);
				rs = pstmt.executeQuery();
				ArrayList<String> temp = new ArrayList<>();
				while(rs.next()) {
					String start = rs.getString("start_day"); 
					String end = rs.getString("end_day"); 
					temp.add(start + "~" + end);
				}
				reservations.put(room,temp);
			}
			return reservations;
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con,pstmt,rs);
		}
	}
}