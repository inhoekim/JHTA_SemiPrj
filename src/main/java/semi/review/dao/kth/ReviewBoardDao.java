package semi.review.dao.kth;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import semi.img_file.dao.kth.ImgFileDao;
import semi.img_file.vo.kth.ImgFileVo;
import semi.review.vo.kth.ReviewBoardVo;
import semi.review.vo.kth.ReviewCommentsVo;
import semi.room.dao.kth.RoomDao;

public class ReviewBoardDao {
	private static ReviewBoardDao instance;
	
	private ReviewBoardDao() {}
	
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
			if (field == null || field.equals("")) {
				sql = "select * from "
						+ "    ("
						+ "    select board.*, rownum rnum from "
						+ "        ("
						+ "            select * "
						+ "            from review "
						+ "            order by review_id desc"
						+ "        )board"
						+ "    )where rnum >= ? and rnum <= ?";
			} else {
				sql = "select * from "
						+ "    ("
						+ "    select board.*, rownum rnum from "
						+ "        ("
						+ "            select * "
						+ "            from review "
						+ "			   where " + field + " like '%" + keyword + "%' "
						+ "            order by review_id desc"
						+ "        )board"
						+ "    )where rnum >= ? and rnum <= ?";
			}
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
	public int getPageMaxNum(String field, String keyword, int room_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = JdbcUtil.getCon();
			String sql = "select nvl(count(review_id), 0) cnt "
					+ "from review";
			if (field != null && !field.equals("")) {
				sql += " where " + field + " like '%" + keyword + "%'";
			} else if (room_id != 0) {
				sql += " where room_id = '" + room_id + "'";
			}
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
	
	// 객실 정보에 리뷰  5개씩 뿌리기
	public ArrayList<ReviewBoardVo> roomDetailReview(int room_id, int startRow, int endRow) {
		ArrayList<ReviewBoardVo> list = new ArrayList<ReviewBoardVo>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = JdbcUtil.getCon();
			String sql = "select * from "
					+ "    ("
					+ "    select board.*, rownum rnum from "
					+ "        ("
					+ "            select * "
					+ "            from review "
					+ "            order by review_id desc"
					+ "        )board"
					+ "    )where room_id = ? and rnum >= ? and rnum <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, room_id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int review_id = rs.getInt("review_id");
				String hlogin_id = rs.getString("hlogin_id");
				String content = rs.getString("content");
				int rate = rs.getInt("rate");
				Date created_day = rs.getDate("created_day");
				
				// 아이디 익명성
				//String hlogin_id = hlogin_id.substring(0, 4) + "****";
				
				ReviewBoardVo vo = new ReviewBoardVo(review_id, room_id, hlogin_id, null, content, rate, 0, 0, created_day, null);
				list.add(vo);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// review_id 최대 수 출력
	public int reviewMaxNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = JdbcUtil.getCon();
			String sql = "select nvl(max(review_id), 0) mnum "
					+ "from review";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int maxNum = rs.getInt("mnum");
				return maxNum;
			}
			return -1;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		} finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	
	// 리뷰 등록
	public int reviewInsert(ReviewBoardVo vo, ImgFileVo imgFileVo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ImgFileDao imgFiledao = ImgFileDao.getInstance();
		
		int reviewNum = reviewMaxNum() + 1;
		
		
		try {
			con = JdbcUtil.getCon();
			String sql = "insert into review "
					+ "values(?, ?, ?, ?, ?, ?, ?, ?, sysdate, null)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, reviewNum);
			pstmt.setInt(2, vo.getRoom_id());
			pstmt.setString(3, vo.getHlogin_id());
			pstmt.setString(4, vo.getTitle());
			pstmt.setString(5, vo.getContent());
			pstmt.setInt(6, vo.getRate());
			pstmt.setInt(7, vo.getViews());
			pstmt.setInt(8, vo.getRecommend());
			int n = pstmt.executeUpdate();
			// 이미지 파일 등록
			if (imgFileVo != null) {
				imgFiledao.imgFileInsert(imgFileVo, reviewNum);
			}
			return n;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		} finally {
			JdbcUtil.close(con, pstmt, rs);
		}
		
	}
	
	// 리뷰 가져오기
	public ReviewBoardVo getReivew(int review_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = JdbcUtil.getCon();
			String sql = "select * from review where review_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, review_id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				int room_id = rs.getInt("room_id");
				String hlogin_id = rs.getString("hlogin_id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Date created_day = rs.getDate("created_day");
				
				ReviewBoardVo vo = new ReviewBoardVo(review_id, room_id, hlogin_id, title, content, 0, 0, 0, created_day, null);
				return vo;
			}
			return null;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	
	// 리뷰 삭제
	public boolean reviewDelete(int review_id) {
		Connection con = null;
		CallableStatement cstmt = null;
		
		try {
			con = JdbcUtil.getCon();
			String sql = "{call review_del_proc(?)}";
			cstmt = con.prepareCall(sql);
			cstmt.setInt(1, review_id);
			boolean check = cstmt.execute();
			return check;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JdbcUtil.close(con, cstmt, null);
		}
	}
	// 조회수
	public void viewsUpdate(int review_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = JdbcUtil.getCon();
			String sql = "update review "
					+ "set views = views + 1 "
					+ "where review_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, review_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	
	// 리뷰 수정
	public void reviewUpdate(int review_id, String title, String content) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = JdbcUtil.getCon();
			String sql = "update review "
					+ "set title = ?, content = ? "
					+ "where review_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, review_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	
}
