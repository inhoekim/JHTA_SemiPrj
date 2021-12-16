package semi.review.dao.kth;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import semi.review.vo.kth.ReviewCommentsVo;

public class ReviewCommentsDao {
	private static ReviewCommentsDao instance;
	
	private ReviewCommentsDao() {}
	
	public static ReviewCommentsDao getInstance() {
		if (instance == null) {
			instance = new ReviewCommentsDao();
		}
		return instance;
	}
	
	// 댓글 등록
	public void commentInsert(ReviewCommentsVo vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int comment_id = commentAllMaxNum() + 1;
		System.out.println("comm : " + comment_id);
		try {
			con = JdbcUtil.getCon();
			String sql = "insert into comments "
					+ "values(?, ?, ?, ?, ?, sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, comment_id);
			pstmt.setInt(2, vo.getReview_id());
			pstmt.setString(3, vo.getHlogin_id());
			pstmt.setString(4, vo.getContent());
			pstmt.setInt(5, vo.getRead());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	
	// 해당 게시물 모든 댓글 출력
	public ArrayList<ReviewCommentsVo> getCommentList(int review_id,
			int startRow, int endRow) {
		ArrayList<ReviewCommentsVo> list = new ArrayList<ReviewCommentsVo>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = JdbcUtil.getCon();
			String sql = " select * from "
					+ "("
					+ "    select comments.*, rownum rnum from "
					+ "    (                "
					+ "        select * "
					+ "        from comments "
					+ "        where review_id = ? "
					+ "        order by comment_id asc"
					+ "    )comments"
					+ ")where rnum >= ? and rnum <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, review_id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int comment_id = rs.getInt("comment_id");
				String hlogin_id = rs.getString("hlogin_id");
				String content = rs.getString("content");
				Date created_day =  rs.getDate("created_day");
				ReviewCommentsVo vo = new ReviewCommentsVo(comment_id, review_id, hlogin_id, content, 0, created_day);
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
	
	//  전체 댓글 수 출력
	public int commentAllMaxNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = JdbcUtil.getCon();
			String sql = "select nvl(max(comment_id), 0) mnum "
					   + "from comments";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			int maxNum = rs.getInt("mnum");
			return maxNum;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		} finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	
	// 해당 리뷰 댓글 수
	public int commentCountNum(int review_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = JdbcUtil.getCon();
			String sql = "select nvl(count(review_id), 0) cnt "
					   + "from comments "
					   + "where review_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, review_id);
			rs = pstmt.executeQuery();
			rs.next();
			int maxNum = rs.getInt("cnt");
			return maxNum;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		} finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	
	// 댓글 삭제
	public int commentDelete(int comment_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		con = JdbcUtil.getCon();
		String sql = "delete comments "
				   + "where comment_id = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, comment_id);
			int n = pstmt.executeUpdate();
			return n;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		} finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	
	// 알림 댓글 가져오기
	public ArrayList<ReviewCommentsVo> selectReview(String hlogin_id) {
		ArrayList<ReviewCommentsVo> list = new ArrayList<ReviewCommentsVo>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = JdbcUtil.getCon();
			String sql = "select c.review_id, comment_id, c.hlogin_id, c.content "
					+ "from review r, comments c "
					+ "where r.review_id = c.review_id "
					+ "and r.hlogin_id = ? "
					+ "and c.read = 1";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, hlogin_id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int review_id = rs.getInt("review_id");
				int comment_id = rs.getInt("comment_id");
				String hloginId = rs.getString("hlogin_id");
				String content = rs.getString("content");
				ReviewCommentsVo vo = new ReviewCommentsVo(comment_id, review_id, hloginId, content, 1, null);
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
	
	// 댓글 알림 제거
	public void alarmDelete(int comment_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = JdbcUtil.getCon();
			String sql = "update comments "
					+ "set read = 2"
					+ "where comment_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, comment_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(con, pstmt, null);
		}
		
	}
	
	// 알람 총개수 
	public int alarmCount(String hlogin_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = JdbcUtil.getCon();
			String sql = "select nvl(count(comment_id), 0) cnt "
					+ "from comments c, review r "
					+ "where c.review_id = r.review_id "
					+ "and read = 1 "
					+ "and r.hlogin_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, hlogin_id);
			rs = pstmt.executeQuery();
			rs.next();
			int count = rs.getInt("cnt");
			return count;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		} finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
}
