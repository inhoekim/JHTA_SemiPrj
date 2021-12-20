package semi.reserve.vo.ihk;

import java.sql.Date;

public class ReserveVo {
	private int reserve_id; //pk(예약아이디)
	private String hlogin_id; //fk(회원아이디)
	private String room_id; //fk(객실아이디)
	private String start_day;
	private String end_day;
	private Date reserve_date;
	private int statement; // 1: 예약진행중, 2:예약완료, 3:예약취소 
	
	public ReserveVo(int reserve_id, String hlogin_id, String room_id, String start_day, String end_day,
			Date reserve_date, int statement) {
		this.reserve_id = reserve_id;
		this.hlogin_id = hlogin_id;
		this.room_id = room_id;
		this.start_day = start_day;
		this.end_day = end_day;
		this.reserve_date = reserve_date;
		this.statement = statement;
	}
	public int getReserve_id() {
		return reserve_id;
	}
	public void setReserve_id(int reserve_id) {
		this.reserve_id = reserve_id;
	}
	public String getHlogin_id() {
		return hlogin_id;
	}
	public void setHlogin_id(String hlogin_id) {
		this.hlogin_id = hlogin_id;
	}
	public String getRoom_id() {
		return room_id;
	}
	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}
	public String getStart_day() {
		return start_day;
	}
	public void setStart_day(String start_day) {
		this.start_day = start_day;
	}
	public String getEnd_day() {
		return end_day;
	}
	public void setEnd_day(String end_day) {
		this.end_day = end_day;
	}
	public Date getReserve_date() {
		return reserve_date;
	}
	public void setReserve_date(Date reserve_date) {
		this.reserve_date = reserve_date;
	}
	public int getStatement() {
		return statement;
	}
	public void setStatement(int statement) {
		this.statement = statement;
	}
}
