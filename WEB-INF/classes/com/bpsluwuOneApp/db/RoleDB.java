package com.bpsluwuOneApp.db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.bpsluwuOneApp.dto.*;
public class RoleDB {
    public static RoleModel getRole(int input_id){
		Connection koneksi_db = null;
		PreparedStatement ps = null;
		ResultSet hasil = null;
		RoleModel returnValue = null;
		try{
			koneksi_db =  ConnectionDB.getConnection();
			ps = koneksi_db.prepareStatement("select * from role_web where id = ?;");
			ps.setInt(1,input_id);
			hasil = ps.executeQuery();
			while(hasil.next()){
				int id = hasil.getInt("id");
				String ket = hasil.getString("ket");
				returnValue = new RoleModel();
				returnValue.setId(id);
				returnValue.setKet(ket);
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
