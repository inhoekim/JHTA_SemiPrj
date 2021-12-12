package semi.room.dao.kth;

public class RoomDao {
	private static RoomDao instance;
	
	public static RoomDao getInstance() {
		if (instance == null) {
			instance = new RoomDao();
		}
		return instance;
	}
	
}
