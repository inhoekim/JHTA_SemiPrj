package db;

import java.io.FileReader;  
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JdbcUtil {
	public static Connection getCon() {
		Properties prop = new Properties();
		Connection con = null;
		try {
			prop.load(new JdbcUtil().getClass().getResourceAsStream("jdbc.properties"));
			String url = prop.getProperty("url");
			String id = prop.getProperty("id");
			String pwd = prop.getProperty("pwd");
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("db접속완료!");
			return con;
		}catch(IOException e) {
			System.out.println("properties 파일 로딩 실패");
			e.printStackTrace();
		}
		catch(ClassNotFoundException e) {
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
