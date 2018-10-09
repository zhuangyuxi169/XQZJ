package dbutil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {
	public DBUtil(){}
	private static String driverName="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static String dbURL="jdbc:sqlserver://localhost:1433;DatabaseName=model";
	private static String userName="sa";
	private static String userPwd="123456";
	
	
	public static Connection getConnection(){
		Connection dbConn=null;
		try{
			Class.forName(driverName);
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("加载驱动失败!");
		}
		try{
			dbConn=DriverManager.getConnection(dbURL,userName,userPwd);
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("SQL Server连接失败!");
		}
		return dbConn;
	}
	
	public static void close(Statement state,Connection con){
		if(state!=null){
			try{
				state.close();
			}catch(SQLException e){
	            
			}
		}
		if(con!=null){
			try{
				con.close();
			}catch(SQLException e){
				
			}
		}
	}
	
	public static void close(ResultSet rs,java.sql.Statement state,Connection con){
		if(rs!=null)
			try{
				rs.close();
			}catch(SQLException e){
				
			}
		if(state!=null)
			try{
				state.close();
			}catch(SQLException e){}
		if(con!=null)
			try{
				con.close();
			}catch(SQLException e){}
	}
}
