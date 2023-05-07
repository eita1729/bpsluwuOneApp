package com.bpsluwuOneApp.db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.bpsluwuOneApp.db.ConnectionDB;
import com.bpsluwuOneApp.dto.*;
public class UserDB{
	public static UserModel getUser(int input_id){
		Connection koneksi_db = null;
		PreparedStatement ps = null;
		ResultSet hasil = null;
		UserModel returnValue = null;
		try{
			koneksi_db =  ConnectionDB.getConnection();
			ps = koneksi_db.prepareStatement("select * from user_web where id = ?;");
			ps.setInt(1,input_id);
			hasil = ps.executeQuery();
			while(hasil.next()){
				int id = hasil.getInt("id");
				String username = hasil.getString("username");
				String password = hasil.getString("password");
				String status = hasil.getString("status");
				int role_id = hasil.getInt("role_id");
				RoleModel roleModel = RoleDB.getRole(role_id);
				returnValue = new UserModel();
				returnValue.setId(id);
				returnValue.setUsername(username);
				returnValue.setPassword(password);
				returnValue.setStatus(status);
				returnValue.setRole_model(roleModel);
			}
		} catch(Exception ee){
			System.out.println(ee.getMessage());
		} finally{
			ConnectionDB.closeResultSet(hasil);
			ConnectionDB.closeStatement(ps);
			ConnectionDB.closeConnection(koneksi_db);
			return returnValue;
		}
	}
}