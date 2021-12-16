package semi.room.vo.ihk;

public class RoomVo {
	private int room_id;
	private String kind;
	private int capacity;
	private int price;
	private Double rate; // 평점
	private String src_name; // 파일 경로
	
	public RoomVo(int room_id, String kind, int capacity, int price, Double rate, String src_name) {
		this.room_id = room_id;
		this.kind = kind;
		this.capacity = capacity;
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

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Double getRate() {
		return rate;
	}

	public void setRate(Double rate) {
		this.rate = rate;
	}

	public String getSrc_name() {
		return src_name;
	}

	public void setSrc_name(String src_name) {
		this.src_name = src_name;
	}

	
}
