package semi.payment.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import db.JdbcUtil;
import semi.payment.vo.PaymentVo;

public class PaymentDao {
	private static PaymentDao paymentDao = new PaymentDao();
	
	private PaymentDao() {}
	
	public static PaymentDao getinstance() {return paymentDao;}
	
	public int insert(PaymentVo vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql= "insert into payment values(seq_payment.nextval,?,?,?,1)";
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, vo.getReserve_id());
			pstmt.setInt(2, vo.getMethod());
			pstmt.setInt(3, vo.getPayment());
			return pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con,pstmt,null);
		}
	}
}
