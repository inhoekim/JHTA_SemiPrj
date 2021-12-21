package semi.reserve.dao.ihk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import org.json.JSONArray;
import org.json.JSONObject;

import db.JdbcUtil;
import semi.payment.dao.PaymentDao;


public class ReserveDao {

	private static ReserveDao reserveDao = new ReserveDao();
	
	private ReserveDao() {}
	
	public static ReserveDao getInstance() {
		return reserveDao;
	}
	//예약하기
	public int reserve(String userID,int roomID,String checkIn,String checkOut) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "Insert into reserve values (seq_reserve.nextval, ?, ?, ?, ?, sysdate, 1)";
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userID);
			pstmt.setInt(2, roomID);
			pstmt.setString(3, checkIn);
			pstmt.setString(4, checkOut);
			int result =  pstmt.executeUpdate();
			if(result > 0) {
				sql = "select seq_reserve.currval from dual";
				pstmt = con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				rs.next();
				return rs.getInt(1);
			}
			else return 0;
		}catch(SQLException e) {
			e.printStackTrace();
			return 0;
		}finally {
			JdbcUtil.close(con,pstmt,rs);
		}
	}
	
	//예약확정
	public int confirmReserve(int reserve_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "Update reserve Set statement = 2 where reserve_id = ?";
		try {
			con = JdbcUtil.getCon();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, reserve_id);
			if(pstmt.executeUpdate() > 0) {
				PaymentDao paymentDao = PaymentDao.getInstance();
				if(paymentDao.confirmPayment(reserve_id) > 0) {
					con.commit();
					return 1;
				}
				else return -1;
			}
			else return -1;
		}catch(SQLException e) {
			e.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con,pstmt,null);
		}
	}
	
	//예약취소
	public int cancleReserve(int reserve_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "Update reserve Set statement = 3 where reserve_id = ?";
		try {
			con = JdbcUtil.getCon();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, reserve_id);
			if(pstmt.executeUpdate() > 0) {
				PaymentDao paymentDao = PaymentDao.getInstance();
				if(paymentDao.canclePayment(reserve_id) > 0) {
					con.commit();
					return 1;
				}
				else return -1;
			}
			else return -1;
		}catch(SQLException e) {
			e.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con,pstmt,null);
		}
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
	
	//테이블의 row 총 갯수 리턴
	public int getRowCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql= "select count(reserve_id) from reserve";
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
			return 0;
		}finally {
			JdbcUtil.close(con,pstmt,rs);
		}
	}
	
	//테이블에서 특정범위의 row를 리턴한다. row들은 jstl에서 쉽게 표시될수 있도록 jsonarry에 담는다.
	public JSONArray getRangeRow(int first, int end) {
		JSONArray arr = new JSONArray();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql= "select * from (select rownum as rnum, temp.* from "
				+ "(select r.reserve_id, r.room_id, kind, capacity, rm.price, start_day, end_day, reserve_date, r.statement "
				+ "from reserve r join payment p on r.reserve_id = p.reserve_id "
				+ "join room rm on r.room_id = rm.room_id "
				+ "where hlogin_id = 'test' "
				+ "order by reserve_id desc)temp) "
				+ "where rnum >= " + first + " and rnum <= " + end;
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				JSONObject json = new JSONObject();
				json.put("rnum", rs.getInt("rnum"));
				json.put("reserve_id", rs.getString("reserve_id"));
				json.put("room_id", rs.getInt("room_id"));
				json.put("kind", rs.getString("kind"));
				json.put("capacity", rs.getInt("capacity"));
				json.put("start_day", rs.getString("start_day"));
				json.put("end_day", rs.getString("end_day"));
				json.put("reserve_date", rs.getDate("reserve_date"));
				json.put("statement", rs.getInt("statement"));
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				long day = 0;
				try {
					day = (dateFormat.parse(rs.getString("end_day")).getTime() - dateFormat.parse(rs.getString("start_day")).getTime());
					day = day / (24*60*60*1000);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				json.put("days", (int)day);
				json.put("cost", (int)day * rs.getInt("price"));
				arr.put(json);
			}
			return arr;
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con,pstmt,rs);
		}
	}
}
