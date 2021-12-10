package semi.member.dao.je;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.JdbcUtil;
import oracle.jdbc.proxy.annotation.Pre;
import semi.member.Vo.je.BoardVoje;

public class BoardDaoje {
	
  public int getMaxNum() {
		  Connection con=null;
		  PreparedStatement pstmt=null;
		  String sql="select NVL(max(service_id),0) mnum from service";
		  ResultSet rs=null;
		  try {
			  con=JdbcUtil.getCon();
			  pstmt=con.prepareStatement(sql);
			  rs=pstmt.executeQuery();
			  rs.next();
			  int maxnum = rs.getInt("mnum");
			  return maxnum;
		  }catch(SQLException s) {
			  s.printStackTrace();
			  return -1;
		  }finally {
			  JdbcUtil.close(con,pstmt,rs);
		  }
	  }
	
  public int insert(BoardVoje vo) {  
	  Connection con=null;
	  PreparedStatement pstmt2=null;
	  PreparedStatement pstmt1=null;
	  try {
		  con=JdbcUtil.getCon();
		  int serviceNum=getMaxNum()+1;
		  int service_id=vo.getService_id();
		  int ref=vo.getRef();
		  int lev=vo.getLev();
		  int step=vo.getStep();
		  if(service_id==0) {//새글인 경우
			  ref=serviceNum;		  
		  }else {//답글인 경우
			  String sql2="update service set step=step+1 where ref=? and step>?";
			  pstmt2=con.prepareStatement(sql2);
			  pstmt2.setInt(1, ref);
			  pstmt2.setInt(2, step);
			  pstmt2.executeUpdate();
			  lev +=1;
			  step +=1;	  
		  }
		  service_id=serviceNum;
		  String sql1="insert into service values(?,?,?,?,?,?,?,?,sysdate,null)";
		  pstmt1=con.prepareStatement(sql1);
		  pstmt1.setInt(1, service_id);
		  pstmt1.setString(2,vo.getHlogin_id());
		  pstmt1.setString(3, vo.getTitle());
		  pstmt1.setString(4, vo.getContent());
		  pstmt1.setString(5, vo.getPwd());
		  pstmt1.setInt(6, ref);
		  pstmt1.setInt(7,lev);
		  pstmt1.setInt(8, step);
		  int n=pstmt1.executeUpdate();
		  return n;
	  }catch(SQLException s) {
		  s.printStackTrace();
		  return -1;
	  }finally {
		  JdbcUtil.close(con);
		  JdbcUtil.close(pstmt1);
		  JdbcUtil.close(pstmt2);
	  }
  }
	
}
