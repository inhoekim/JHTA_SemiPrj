package semi.reserve.vo.ihk;

public class ReserveVo {
	private int reserve_id; //pk(예약아이디)
	private String hlogin_id; //fk(회원아이디)
	private String room_id; //fk(객실아이디)
	private String start_day;
	private String end_day;
	private int statement; // 1: 예약진행중, 2:예약완료, 3:예약취소 
}
