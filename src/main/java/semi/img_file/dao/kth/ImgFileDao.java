package semi.img_file.dao.kth;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.JdbcUtil;
import semi.img_file.vo.kth.ImgFileVo;

public class ImgFileDao {
	private static ImgFileDao instance;
	
	private ImgFileDao() {}
	
	public static ImgFileDao getInstance() {
		if (instance == null) {
			instance = new ImgFileDao();
		}
		return instance;
	}
	
	// 리뷰 작성(이미지 업로드)
	public int imgFileInsert(ImgFileVo vo, int review_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		con = JdbcUtil.getCon();
		String sql = "insert into files2 "
				   + "values(seq_files2.nextval, ?, ?, ?, ?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, review_id);
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
	
	// 리뷰 이미지파일 불러오기
	public String getImage(int review_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = JdbcUtil.getCon();
			String sql = "select rv.review_id, src_name "
					+ "from review2 rv, files2 fs "
					+ "where rv.review_id = fs.review_id and rv.review_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, review_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String src_name = rs.getString("src_name");
				return src_name;
			}
			return null;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
