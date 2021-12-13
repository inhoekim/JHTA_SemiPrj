package semi.img_file.dao.kth;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.JdbcUtil;
import semi.img_file.vo.kth.ImgFileVo;

public class ImgFileDao {
	private static ImgFileDao instance;
	
	public static ImgFileDao getInstance() {
		if (instance == null) {
			instance = new ImgFileDao();
		}
		return instance;
	}
	
	// 리뷰 작성(이미지 업로드)
	public int imgFileInsert(ImgFileVo vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		con = JdbcUtil.getCon();
		String sql = "insert into files2 "
				   + "values(seq_files2.nextval, ?, ?, ?, ?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, vo.getReview_id());
			pstmt.setString(2, vo.getType());
			pstmt.setString(3, vo.getOrg_name());
			pstmt.setString(4, vo.getSrc_name());
			int n = pstmt.executeUpdate();
			return n;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		} finally {
			JdbcUtil.close(con, pstmt, null);
		}
		
	}
}
