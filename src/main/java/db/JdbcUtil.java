package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcUtil {
	public static Connection getCon() { 
		Connection con = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			con = DriverManager.getConnection(url, "c##scott", "tiger");
			System.out.println("db접속완료!");
			return con;
		}catch(ClassNotFoundException e) {
			System.out.println("db접속 실패");
			e.printStackTrace();
		}catch(SQLException e) {
			System.out.println("db로딩 실패");
			e.printStackTrace();
		}
		return null;
	}
	public static void close(Connection con) {
			try {
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	public static void close(Statement stmt) {
		try {
			if(stmt != null) stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void close(ResultSet rs) {
		try {
			if(rs != null) rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void close(Connection con, Statement stmt, ResultSet rs) {
		try {
			if(con != null) con.close();
			if(stmt != null) stmt.close();
			if(rs != null) rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}	
}
