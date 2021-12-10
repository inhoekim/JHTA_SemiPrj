package semi.member.dao.je;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.JdbcUtil;

public class BoardDaoje {
	
  public int insert(String id,String title,String content,String pwd) {
	  Connection con=null;
	  PreparedStatement pstmt=null;
	  String sql="insert into service values()";
	  try {
		  con=JdbcUtil.getCon();
		  pstmt=con.prepareStatement(sql);
		  
	  }catch(SQLException s) {
		  s.printStackTrace();
	  }
	return 0; 
  }
	
}
