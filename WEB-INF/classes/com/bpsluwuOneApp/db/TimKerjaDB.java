package com.bpsluwuOneApp.db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.bpsluwuOneApp.dto.*;
public class TimKerjaDB {
	public static TimKerjaModel.Collection getAllTimKerja(){
		Connection koneksi_db = null;
		PreparedStatement ps = null;
		ResultSet hasil = null;
		TimKerjaModel.Collection returnValue = null;
		try{
			koneksi_db =  ConnectionDB.getConnection();
			ps = koneksi_db.prepareStatement("select * from tim_kerja;");
			hasil = ps.executeQuery();
			returnValue = new TimKerjaModel.Collection();
			while(hasil.next()){
				int id = hasil.getInt("id");
				String nama = hasil.getString("nama");
				TimKerjaModel timKerjaModel = new TimKerjaModel();
				timKerjaModel.setId(id);
				timKerjaModel.setNama(nama);
				returnValue.getCollection().add(timKerjaModel);
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
    public static TimKerjaModel getTimKerja(int input_id){
		Connection koneksi_db = null;
		PreparedStatement ps = null;
		ResultSet hasil = null;
		TimKerjaModel returnValue = null;
		try{
			koneksi_db =  ConnectionDB.getConnection();
			ps = koneksi_db.prepareStatement("select * from tim_kerja where id = ?;");
			ps.setInt(1,input_id);
			hasil = ps.executeQuery();
			while(hasil.next()){
				int id = hasil.getInt("id");
				String nama = hasil.getString("nama");
				returnValue = new TimKerjaModel();
				returnValue.setId(id);
				returnValue.setNama(nama);
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
	public static TimKerjaModel.Collection getTimKerjaByPegawai(int input_id){
		Connection koneksi_db = null;
		PreparedStatement ps = null;
		ResultSet hasil = null;
		TimKerjaModel.Collection returnValue = null;
		try{
			koneksi_db =  ConnectionDB.getConnection();
			ps = koneksi_db.prepareStatement("select * from tim_kerja right join pegawai_tim_bridge on tim_kerja.id = pegawai_tim_bridge.tim_kerja_id where pegawai_tim_bridge.pegawai_id = ?;");
			ps.setInt(1,input_id);
			hasil = ps.executeQuery();
			returnValue = new TimKerjaModel.Collection();
			while(hasil.next()){
				int id = hasil.getInt("tim_kerja_id");
				String nama = hasil.getString("nama");
				TimKerjaModel timKerjaModel = new TimKerjaModel();
				timKerjaModel.setId(id);
				timKerjaModel.setNama(nama);
				returnValue.getCollection().add(timKerjaModel);
				//System.out.println(timKerjaModel.getJSONObject());
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
