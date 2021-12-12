package semi.room.vo.kth;

public class RoomVo {
	private int room_id;
	private String kind;
	private int capcity;
	private int price;
	private int rate; // 평점
	private String src_name; // 파일 경로
	
	public RoomVo(int room_id, String kind, int capcity, int price, int rate, String src_name) {
		this.room_id = room_id;
		this.kind = kind;
		this.capcity = capcity;
		this.price = price;
		this.rate = rate;
		this.src_name = src_name;
	}

	public int getRoom_id() {
		return room_id;
	}

	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public int getCapcity() {
		return capcity;
	}

	public void setCapcity(int capcity) {
		this.capcity = capcity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public String getSrc_name() {
		return src_name;
	}

	public void setSrc_name(String src_name) {
		this.src_name = src_name;
	}
	
}
