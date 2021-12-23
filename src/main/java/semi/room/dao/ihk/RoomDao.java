package semi.room.dao.ihk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import org.json.JSONArray;
import org.json.JSONObject;

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
		String sql = "Select room_id from room where capacity >= ?";
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
	
	// 해당 room_id의 객실 정보 호출
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
				String src = rs.getString("src_name");
				return new RoomVo(room_id,kind,capacity,price,rate,src);
			}else return null;
			
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con,pstmt,rs);
		}
	}
	
	//room에 해당하는 예약기록을 HashMap<year-month,ArrayList<day>> 느낌으로 넣어서 리턴
	public JSONObject getReserves(int room){
		JSONObject json = new JSONObject();
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		DateFormat df = new SimpleDateFormat("yyyy-M");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		try {
			con = JdbcUtil.getCon();
			ArrayList<String> arr = new ArrayList<>();
			for(int i = 0; i < 12; i++) {
				String yymm = new SimpleDateFormat("yyyyMM").format(cal.getTime());
				DateFormat df2 = new SimpleDateFormat("yyyy-MM-dd");
				sql = "select * from reserve where room_id = ? and statement != 3 and start_day like '" 
				+ df.format(cal.getTime()) +"%' order by start_day";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, room);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					try {
						Calendar startCal = Calendar.getInstance();
						startCal.setTime(df2.parse(rs.getString("start_day")));
						Calendar endCal =  Calendar.getInstance();
						endCal.setTime(df2.parse(rs.getString("end_day")));
						while(startCal.compareTo(endCal) != 0) {
							String temp = new SimpleDateFormat("yyyyMM").format(startCal.getTime());
							if(!yymm.equals(temp)) {
								json.put(yymm, arr);
								yymm = temp;
								arr = new ArrayList<>();
							}
							arr.add(temp + "" + new SimpleDateFormat("dd").format(startCal.getTime()));
							startCal.add(Calendar.DATE, 1);
						}	
					}catch (ParseException e) {
						e.printStackTrace();
					}
				}
				json.put(yymm, arr);
				cal.add(Calendar.MONTH, 1);
			}
			return json;
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con,pstmt,rs);
		}
	}
	
	// 리뷰 작성(평점 불러오기)
	public double reviewRate(int room_id) {
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
				double rate = rs.getDouble("rate");
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
		double roomRate = reviewRate(room_id);
		
		if (roomRate != 0) {
			// 객실 평점
			double rating = (reviewRate(room_id) + rate) / 2;
			// 평점 소수 점 변환
			roomRate = Double.parseDouble(String.format("%.1f", rating));
		} else {
			roomRate = rate;
		}
		
		try {
			con = JdbcUtil.getCon();
			String sql = "update room "
					+ "set rate = ? "
					+ "where room_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setDouble(1, roomRate);
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
