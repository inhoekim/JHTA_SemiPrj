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
		
		int comment_id = commentMaxNum() + 1;
		System.out.println("comm : " + comment_id);
//		int num = 0;
//		int ref = 0;
//		int lev = 0;
//		int step = 0;
		
		try {
		
//		if (num == 0) {
//			ref = comment_id;
//		} else {
//			String sql2 = "update comments2 "
//						+ "set step = step + 1 where ref = ? and step > ?";
//			pstmt2 = con.prepareStatement(sql2);
//			pstmt2.setInt(1, ref);
//			pstmt2.setInt(2, step);
//			pstmt2.executeUpdate();
//		}
			con = JdbcUtil.getCon();
			String sql = "insert into comments2 "
					+ "values(?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, comment_id);
			pstmt.setInt(2, vo.getReview_id());
			pstmt.setString(3, vo.getHlogin_id());
			pstmt.setString(4, vo.getContent());
			pstmt.setInt(5, vo.getRef());
			pstmt.setInt(6, vo.getLev());
			pstmt.setInt(7, vo.getStep());
			pstmt.setInt(8, vo.getRead());
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
					+ "        from comments2 "
					+ "        where review_id = ? "
					+ "        order by comment_id asc, step desc"
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
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");
				int step = rs.getInt("step");
				Date created_day =  rs.getDate("created_day");
				ReviewCommentsVo vo = new ReviewCommentsVo(comment_id, review_id, hlogin_id, content, ref, lev, step, 0, created_day);
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
	
	// review_id 최대 수 출력
		public int commentMaxNum() {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				con = JdbcUtil.getCon();
				String sql = "select nvl(max(comment_id), 0) mnum "
						   + "from comments2";
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
}
