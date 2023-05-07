package com.bpsluwuOneApp.db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import com.zaxxer.hikari.*;
public class ConnectionDB{
	private static HikariDataSource dataSource = null;
	static{
		boolean connectivity = false;
		String supabaseDBUsername = "postgres";
		String supabaseDBPassword = "SupabaseDatabase7";
		String supabaseDBUrl = "jdbc:postgresql://db.xkreizuzyyehgzxywfka.supabase.co:5432/postgres";
		String postgresqlDriverClassName = "org.postgresql.Driver";
		HikariConfig dsConfig = null;
		while(connectivity == false){
			try{
				dsConfig = new HikariConfig();
				dsConfig.setUsername(supabaseDBUsername);
				dsConfig.setPassword(supabaseDBPassword);
				dsConfig.setJdbcUrl(supabaseDBUrl);
				dsConfig.setDriverClassName(postgresqlDriverClassName);
				ConnectionDB.dataSource = new HikariDataSource(dsConfig);
				connectivity = true;
			} catch(Exception ee){
				System.out.println(ee.getMessage());
			}
		}
	}
	public static void startDataSource(){
		//data source connection pooling has started in static block aboce;
	}
	public static Connection getConnection(){
		Connection koneksi_db = null;
		try{
			koneksi_db = ConnectionDB.dataSource.getConnection();
		} catch(Exception ee){
			System.out.println(ee.getMessage());
		}
		return koneksi_db;
	}
	public static void closeConnection(Connection koneksi_db){
		try{

			koneksi_db.close();
		} catch(Exception ee){
		}
	}
	public static void closeStatement(Statement statement_db){
		try{

			statement_db.close();
		} catch(Exception ee){
		}
	}
	public static void closeResultSet(ResultSet resultset_db){
		try{

			resultset_db.close();
		} catch(Exception ee){
		}
	}
	public static HikariDataSource getDataSource() {
		return dataSource;
	}
}