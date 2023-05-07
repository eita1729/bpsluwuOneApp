package com.bpsluwuOneApp.db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.bpsluwuOneApp.dto.*;
public class PegawaiDB{
	public static PegawaiModel.Collection getAllPegawai(){
		Connection koneksi_db = null;
		PreparedStatement ps = null;
		ResultSet hasil = null;
		PegawaiModel.Collection returnValue = null;
		try{
			koneksi_db =  ConnectionDB.getConnection();
			ps = koneksi_db.prepareStatement("select * from pegawai;");
			hasil = ps.executeQuery();
			returnValue = new PegawaiModel.Collection();
			while(hasil.next()){
				int id = hasil.getInt("id");
				String nama = hasil.getString("nama");
				String nip = hasil.getString("nip");
				String nip_lama = hasil.getString("nip_lama");
				String tempat_lahir = hasil.getString("tempat_lahir");
				String tgl_lahir = hasil.getString("tgl_lahir");
				int user_id = hasil.getInt("user_id");
				int status_pegawai_id = hasil.getInt("status_pegawai_id"); 
				UserModel user_model = UserDB.getUser(user_id);
				StatusPegawaiModel status_pegawai_model = StatusPegawaiDB.getStatusPegawai(status_pegawai_id);
				TimKerjaModel.Collection tim_kerja_model = TimKerjaDB.getTimKerjaByPegawai(id);
				PegawaiModel pegawaiModel = new PegawaiModel();
				pegawaiModel.setId(id);
				pegawaiModel.setNama(nama);
				pegawaiModel.setNip(nip);
				pegawaiModel.setNip_lama(nip_lama);
				pegawaiModel.setTempat_lahir(tempat_lahir);
				pegawaiModel.setTgl_lahir(tgl_lahir);
				pegawaiModel.setUser_model(user_model);
				pegawaiModel.setStatus_pegawai_model(status_pegawai_model);
				pegawaiModel.setTim_kerja_model(tim_kerja_model);
				returnValue.getCollection().add(pegawaiModel);
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
	public static PegawaiModel getPegawaiById(int input_id){
		Connection koneksi_db = null;
		PreparedStatement ps = null;
		ResultSet hasil = null;
		PegawaiModel returnValue = null;
		try{
			koneksi_db =  ConnectionDB.getConnection();
			ps = koneksi_db.prepareStatement("select * from pegawai where id=?;");
			ps.setInt(1,input_id);
			hasil = ps.executeQuery();
			returnValue = new PegawaiModel();
			while(hasil.next()){
				int id = hasil.getInt("id");
				String nama = hasil.getString("nama");
				String nip = hasil.getString("nip");
				String nip_lama = hasil.getString("nip_lama");
				String tempat_lahir = hasil.getString("tempat_lahir");
				String tgl_lahir = hasil.getString("tgl_lahir");
				int user_id = hasil.getInt("user_id");
				int status_pegawai_id = hasil.getInt("status_pegawai_id"); 
				UserModel user_model = UserDB.getUser(user_id);
				StatusPegawaiModel status_pegawai_model = StatusPegawaiDB.getStatusPegawai(status_pegawai_id);
				TimKerjaModel.Collection tim_kerja_model = TimKerjaDB.getTimKerjaByPegawai(id);
				returnValue.setId(id);
				returnValue.setNama(nama);
				returnValue.setNip(nip);
				returnValue.setNip_lama(nip_lama);
				returnValue.setTempat_lahir(tempat_lahir);
				returnValue.setTgl_lahir(tgl_lahir);
				returnValue.setUser_model(user_model);
				returnValue.setStatus_pegawai_model(status_pegawai_model);
				returnValue.setTim_kerja_model(tim_kerja_model);
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
	public static PegawaiModel.Collection getPegawaiByTimKerja(int input_id){
		Connection koneksi_db = null;
		PreparedStatement ps = null;
		ResultSet hasil = null;
		PegawaiModel.Collection returnValue = null;
		try{
			koneksi_db =  ConnectionDB.getConnection();
			ps = koneksi_db.prepareStatement("select pegawai.id as id, pegawai.nama as nama,pegawai.nip as nip,pegawai.nip_lama as nip_lama,pegawai.tempat_lahir as tempat_lahir,pegawai.tgl_lahir as tgl_lahir,pegawai.user_id as user_id,pegawai.status_pegawai_id as status_pegawai_id from tim_kerja right join pegawai_tim_bridge on tim_kerja.id = pegawai_tim_bridge.tim_kerja_id right join pegawai on pegawai.id = pegawai_tim_bridge.pegawai_id where tim_kerja.id = ?;");
			ps.setInt(1,input_id);
			hasil = ps.executeQuery();
			returnValue = new PegawaiModel.Collection();
			while(hasil.next()){
				int id = hasil.getInt("id");
				String nama = hasil.getString("nama");
				String nip = hasil.getString("nip");
				String nip_lama = hasil.getString("nip_lama");
				String tempat_lahir = hasil.getString("tempat_lahir");
				String tgl_lahir = hasil.getString("tgl_lahir");
				int user_id = hasil.getInt("user_id");
				int status_pegawai_id = hasil.getInt("status_pegawai_id"); 
				UserModel user_model = UserDB.getUser(user_id);
				StatusPegawaiModel status_pegawai_model = StatusPegawaiDB.getStatusPegawai(status_pegawai_id);
				TimKerjaModel.Collection tim_kerja_model = TimKerjaDB.getTimKerjaByPegawai(id);
				PegawaiModel pegawaiModel = new PegawaiModel();
				pegawaiModel.setId(id);
				pegawaiModel.setNama(nama);
				pegawaiModel.setNip(nip);
				pegawaiModel.setNip_lama(nip_lama);
				pegawaiModel.setTempat_lahir(tempat_lahir);
				pegawaiModel.setTgl_lahir(tgl_lahir);
				pegawaiModel.setUser_model(user_model);
				pegawaiModel.setStatus_pegawai_model(status_pegawai_model);
				pegawaiModel.setTim_kerja_model(tim_kerja_model);
				returnValue.getCollection().add(pegawaiModel);
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