package semi.review.dao.kth;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import semi.review.vo.kth.ReviewBoardVo;

public class ReviewBoardDao {
	private static ReviewBoardDao instance;
	
	public static ReviewBoardDao getInstance() {
		if (instance == null) {
			instance = new ReviewBoardDao();
		}
		return instance;
	}
	
	// 모든 리뷰 목록 불러오기
	public ArrayList<ReviewBoardVo> reviewList(int startRow, int endRow, 
			String field, String keyword) {
		ArrayList<ReviewBoardVo> list = new ArrayList<ReviewBoardVo>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = JdbcUtil.getCon();
			String sql = "";
			
				sql = "select * from "
					+ "    ("
					+ "    select board.*, rownum rnum from "
					+ "        ("
					+ "            select * "
					+ "            from review2 "
					+ "            order by review_id desc"
					+ "        )board"
					+ "    )where rnum >= ? and rnum <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int review_id = rs.getInt("review_id");
				int room_id = rs.getInt("room_id");
				String hlogin_id = rs.getString("hlogin_id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int rate = rs.getInt("rate");
				int views = rs.getInt("views");
				int recommend = rs.getInt("recommend");
				Date created_day = rs.getDate("created_day");
				ReviewBoardVo vo = new ReviewBoardVo(review_id, room_id, hlogin_id, title, content, rate, views, recommend, created_day, created_day);
				list.add(vo);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	
	// 총 페이지 수
	public int getPageMaxNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = JdbcUtil.getCon();
			String sql = "select nvl(count(review_id), 0) cnt "
					+ "from review2";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int maxNum = rs.getInt("cnt");
				return maxNum;
			}
			return -1;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
	}
}
