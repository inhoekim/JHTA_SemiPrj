package semi.file.dao.hj;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JdbcUtil;
import semi.img_file.vo.kth.ImgFileVo;

public class FileDao {
	private static FileDao instance;
	private FileDao() {}
	public static FileDao getInstanco() {
		if(instance==null) {
			instance=new FileDao();
		}
		return instance;
	}
	public int insertfile(ImgFileVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			String sql="insert into files values(seq_files.nextval,?,?,?,?,?)";
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, vo.getFile_id());
			pstmt.setInt(2, vo.getReview_id());
			pstmt.setString(3, vo.getType());
			pstmt.setString(4, vo.getOrg_name());
			pstmt.setString(5, vo.getSrc_name());
			pstmt.setDate(6, vo.getCreated_day());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	public int deletefile(int file_id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			String sql="delete from files where file_id=?";
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, file_id);
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	public int updatefile(ImgFileVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			String sql="update files set " +
					"review_id=?, type=?, org_name=?, src_name=?,  created_day=?" +
					"where file_id=?";
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, vo.getReview_id());
			pstmt.setString(2, vo.getType());
			pstmt.setString(3, vo.getOrg_name());
			pstmt.setString(4, vo.getSrc_name());
			pstmt.setInt(5, vo.getFile_id());
			pstmt.setDate(5, vo.getCreated_day());
			return pstmt.executeUpdate();			
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally{
			JdbcUtil.close(con, pstmt, null);
		}
	}
	public ImgFileVo selectfile(int file_id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			String sql="select * from files where file_id=?";
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, file_id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				int review_id=rs.getInt("review_id");
				String type=rs.getString("type");
				String org_name=rs.getString("org_name");
				String src_name=rs.getString("src_name");
				Date created_day=rs.getDate("created_day");
				ImgFileVo vo=new ImgFileVo(file_id, review_id, type, org_name, src_name, null);
				return vo;
			}
			return null;
		}catch(SQLException s) {
			s.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	public ArrayList<ImgFileVo> allselectFile(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			String sql="select * from files";
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			ArrayList<ImgFileVo> list=new ArrayList<ImgFileVo>();
			while(rs.next()) {
				int file_id=rs.getInt("file_id");
				int review_id=rs.getInt("review_id");
				String type=rs.getString("type");
				String org_name=rs.getString("org_name");
				String src_name=rs.getString("src_name");
				Date created_day=rs.getDate("created_day");
				ImgFileVo vo=new ImgFileVo(file_id, review_id, type, org_name, src_name, created_day);
				list.add(vo);
			}
			return list;
		}catch(SQLException s) {
			s.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
}
