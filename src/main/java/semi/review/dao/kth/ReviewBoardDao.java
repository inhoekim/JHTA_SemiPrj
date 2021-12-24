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
import semi.review.vo.kth.RecommendVo;
import semi.review.vo.kth.ReviewBoardVo;

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
				
				if (title.length() > 15) {
					String sub = title.substring(0, 15) + "...";
					title = sub;
				}
				
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
			String sql = "select * "
					   + "from review "
					   + "where room_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, room_id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int review_id = rs.getInt("review_id");
				String hloginId = rs.getString("hlogin_id");
				String content = rs.getString("content");
				int rate = rs.getInt("rate");
				Date created_day = rs.getDate("created_day");
				
				// 아이디 익명성
				String hlogin_id = hloginId.substring(0, 2) + "***";
				
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
			
			// 추천 테이블 등록
			recommendInsert(reviewNum);
			
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
	
	// 리뷰 추천 테이블에 등록
	public void recommendInsert(int review_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = JdbcUtil.getCon();
			String sql = "insert into recommend "
					+ "values(seq_recommend.nextval, ?, 0, 0)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, review_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	
	// 리뷰 보드 추천 수 업데이트
	public void reviewRecommendAdd(int review_id, int recommendNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = JdbcUtil.getCon();
			String sql = "update review "
					+ "set recommend = recommend + ? "
					+ "where review_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, recommendNum);
			pstmt.setInt(2, review_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	
	// 해당 review_id에 추천 수 등록
	public void recommendUpdate(RecommendVo vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = JdbcUtil.getCon();
			String sql = "update recommend "
					+ "set thumb_up = thumb_up + ?, thumb_down = thumb_down + ? "
					+ "where review_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, vo.getThumb_up());
			pstmt.setInt(2, vo.getThumb_down());
			pstmt.setInt(3, vo.getReview_id());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	
	// 좋아요, 싫어요 출력
	public RecommendVo getRecommend(int review_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = JdbcUtil.getCon();
			String sql = "select * "
					+ "from recommend "
					+ "where review_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, review_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int thumb_up = rs.getInt("thumb_up");
				int thumb_down = rs.getInt("thumb_down");
				RecommendVo vo = new RecommendVo(0, 0, thumb_up, thumb_down);
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
	
	// 해당 리뷰 댓글 수 출력
	public ArrayList<Integer> reviewCommentsCount(int startRow, int endRow, String field, String keyword) {
		ArrayList<Integer> list = new ArrayList<Integer>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		try {
			con = JdbcUtil.getCon();
			if (field == null || keyword.equals("")) {
				sql = "select * from "
						+ "						   ("
						+ "						   select board.*, rownum rnum from "
						+ "						        ("
						+ "						           select r.review_id, nvl(count(c.review_id), 0) cnt "
						+ "						from review r, comments c "
						+ "						where r.review_id = c.review_id(+) "
						+ "						group by r.review_id "
						+ "						order by r.review_id desc"
						+ "						        )board"
						+ "						    )where rnum >= ? and rnum <= ?";
				
			} else {
				sql = "select * from "
						+ "						   ("
						+ "						   select board.*, rownum rnum from "
						+ "						        ("
						+ "						           select r.review_id, nvl(count(c.review_id), 0) cnt "
						+ "						from review r, comments c "
						+ "						where r.review_id = c.review_id(+) "
						+ "and r." + field + " like '%" + keyword + "%' "
						+ "						group by r.review_id "
						+ "						order by r.review_id desc"
						+ "						        )board"
						+ "						    )where rnum >= ? and rnum <= ?";
			}
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int cnt = rs.getInt("cnt");
				list.add(cnt);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
}
