package semi.room.dao.hj;

public class RoomDao {
	private static RoomDao instance;
	private RoomDao() {}
	public static RoomDao getInstance() {
		if(instance==null) {
			instance=new RoomDao();
		}
		return instance;
	}
	//객실 리스트, 추가, 수정
}
