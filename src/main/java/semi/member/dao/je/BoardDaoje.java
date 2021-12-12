package semi.member.dao.je;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import db.JdbcUtil;
import oracle.jdbc.proxy.annotation.Pre;
import semi.member.Vo.je.BoardVoje;

public class BoardDaoje {
	
  public int update(String writer,String title, String content,String pwd,int service_id) {	
	  Connection con=null;
	  PreparedStatement pstmt=null;
	  try {
		  con=JdbcUtil.getCon();
		  String sql="update service set writer=?, title=?, content=?, pwd=?, updated_day=sysdate where service_id=?";
		  pstmt=con.prepareStatement(sql);
		  pstmt.setString(1, writer);
		  pstmt.setString(2, title);
		  pstmt.setString(3, content);
		  pstmt.setString(4, pwd);
		  pstmt.setInt(5, service_id);
		  int n=pstmt.executeUpdate();
		  return n;
	  }catch(SQLException s) {
		  s.printStackTrace();
	  }finally {
		  JdbcUtil.close(con,pstmt,null);
	  }
	return -1;
  }
	
	
	
  public BoardVoje select(String pwd,int service_id){
	  Connection con=null;
	  PreparedStatement pstmt=null;
	  ResultSet rs=null;
	  con=JdbcUtil.getCon();
	  String sql="select * from service where pwd=? and service_id=?";
	  try {
		  pstmt=con.prepareStatement(sql);
		  pstmt.setString(1, pwd);
		  pstmt.setInt(2, service_id);
		  rs=pstmt.executeQuery();
		  if(rs.next()) {
			  String writer=rs.getString("writer");
			  String title=rs.getString("title");
			  String content=rs.getString("content");
			  Date created_day=rs.getDate("created_day");
			  Date updated_day=rs.getDate("updated_day");
			  BoardVoje vo=new BoardVoje(service_id, writer,title,content,pwd,0,0,0, created_day,updated_day);
			  return vo;
		  }
	  }catch(SQLException s) {
		  s.printStackTrace();
		  return null;
		  
	  }finally {
		  JdbcUtil.close(con,pstmt,rs);
	  }
	return null;
  }
	
  public BoardVoje detail(int service_id) {
	  Connection con=null;
	  PreparedStatement pstmt=null;
	  ResultSet rs=null;
	  con=JdbcUtil.getCon();
	  String sql="select * from service where service_id";
	  try {
		  pstmt=con.prepareStatement(sql);
		  pstmt.setInt(1, service_id);
		  rs=pstmt.executeQuery();
		  if(rs.next()) {
			  String writer=rs.getString("writer");
			  String title=rs.getString("title");
			  String content=rs.getString("content");
			  String pwd=rs.getString("pwd");
			  int ref=rs.getInt("ref");
			  int lev=rs.getInt("lev");
			  int step=rs.getInt("step");
			  Date created_day=rs.getDate("created_day");
			  Date updated_day=rs.getDate("updated_day");
			  BoardVoje vo=new BoardVoje(service_id, writer, title, content, content, ref, lev, step, created_day, updated_day);
			  return vo;  
		  }
	  }catch(SQLException s) {
		  s.printStackTrace();
		  return null;
	  }finally {
		  JdbcUtil.close(con,pstmt,rs);
	  }
	return null;
  }
	
  public int getCount() {	
	  Connection con=null;
	  PreparedStatement pstmt=null;
	  ResultSet rs=null;
	  String sql="select NVL(count(service_id),0) mnum from service";
	  try {
		  con=JdbcUtil.getCon();
		  pstmt=con.prepareStatement(sql);
		  rs=pstmt.executeQuery();
		  rs.next();
		  int count=rs.getInt(1);
		  return count;
	  }catch(SQLException s) {
		  s.printStackTrace();
		  return -1;
	  }finally {
		  JdbcUtil.close(con,pstmt,rs);
	  }
  }
	
	
  public ArrayList<BoardVoje>list(int startRow,int endRow){
	  Connection con=null;
	  PreparedStatement pstmt=null;
	  ResultSet rs=null;
	  con=JdbcUtil.getCon();
	  String sql= "select * from "
				+ "("
				+ "select board.*,rownum rnum from"
				+ " ("
				+ "    select * from service"
				+ "     order by ref desc,step asc"
				+ "  )board"
				+ ") where rnum>=? and rnum<=?";
	  try {
		  pstmt=con.prepareStatement(sql);
		  pstmt.setInt(1, startRow);
		  pstmt.setInt(2, endRow);
		  rs=pstmt.executeQuery();
		  ArrayList<BoardVoje>list=new ArrayList<BoardVoje>();
		  while(rs.next()) {
			  int service_id=rs.getInt("service_id");
			  String writer=rs.getString("writer");
			  String title=rs.getString("title");
			  String content=rs.getString("content");
			  String pwd=rs.getString("pwd");
			  int ref=rs.getInt("ref");
			  int lev=rs.getInt("lev");
			  int step=rs.getInt("step");
			  Date created_day=rs.getDate("created_day");
			  Date updated_day=rs.getDate("updated_day");
			  BoardVoje vo=new BoardVoje(service_id, writer, title, content, content, ref, lev, step, created_day, updated_day);
			  list.add(vo);		
		  }	  
		  return list;
	  }catch(SQLException s) {
		  s.printStackTrace();
	  }finally {
		  JdbcUtil.close(con,pstmt,rs);
	  }
	return null;

  }
	
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
		  pstmt1.setString(2,vo.getWriter());
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
