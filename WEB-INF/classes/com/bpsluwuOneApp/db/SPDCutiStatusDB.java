package com.bpsluwuOneApp.db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.bpsluwuOneApp.dto.*;
public class SPDCutiStatusDB {
    public static SPDCutiStatusModel getSPDCutiStatus(int input_id){
		Connection koneksi_db = null;
		PreparedStatement ps = null;
		ResultSet hasil = null;
		SPDCutiStatusModel returnValue = null;
		try{
			koneksi_db =  ConnectionDB.getConnection();
			ps = koneksi_db.prepareStatement("select * from spd_cuti_status where id = ?;");
			ps.setInt(1,input_id);
			hasil = ps.executeQuery();
			while(hasil.next()){
				int id = hasil.getInt("id");
				String ket = hasil.getString("ket");
				returnValue = new SPDCutiStatusModel();
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
	public static SPDCutiStatusModel.Collection getAllSPDCutiStatus(){
		Connection koneksi_db = null;
		PreparedStatement ps = null;
		ResultSet hasil = null;
		SPDCutiStatusModel.Collection returnValue = null;
		try{
			koneksi_db =  ConnectionDB.getConnection();
			ps = koneksi_db.prepareStatement("select * from spd_cuti_status;");
			hasil = ps.executeQuery();
			returnValue = new SPDCutiStatusModel.Collection();
			while(hasil.next()){
				int id = hasil.getInt("id");
				String ket = hasil.getString("ket");
				SPDCutiStatusModel spdCutiStatusModel = new SPDCutiStatusModel();
				spdCutiStatusModel.setId(id);
				spdCutiStatusModel.setKet(ket);
				returnValue.getCollection().add(spdCutiStatusModel);
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
