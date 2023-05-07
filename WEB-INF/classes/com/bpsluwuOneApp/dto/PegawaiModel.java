package com.bpsluwuOneApp.dto;
import java.util.ArrayList;
import org.json.*;
public class PegawaiModel{
	private int id = 0;
	private String nama = null;
	private String nip = null;
	private String nip_lama = null;
	private String tempat_lahir = null;
	private String tgl_lahir = null;
	private StatusPegawaiModel status_pegawai_model = null;
	private UserModel user_model = null;
	private TimKerjaModel.Collection tim_kerja_model = null;
	public int getId(){
		return this.id;
	}
	public void setId(int id){
		this.id = id;
	}
	public String getNama() {
		return nama;
	}
	public void setNama(String nama) {
		this.nama = nama;
	}
	public String getNip() {
		return nip;
	}
	public void setNip(String nip) {
		this.nip = nip;
	}
	public String getNip_lama() {
		return nip_lama;
	}
	public void setNip_lama(String nip_lama) {
		this.nip_lama = nip_lama;
	}
	public String getTempat_lahir() {
		return tempat_lahir;
	}
	public void setTempat_lahir(String tempat_lahir) {
		this.tempat_lahir = tempat_lahir;
	}
	public String getTgl_lahir() {
		return tgl_lahir;
	}
	public void setTgl_lahir(String tgl_lahir) {
		this.tgl_lahir = tgl_lahir;
	}
	public UserModel getUser_model() {
		return user_model;
	}
	public void setUser_model(UserModel user_model) {
		this.user_model = user_model;
	}
	public StatusPegawaiModel getStatus_pegawai_model() {
		return status_pegawai_model;
	}
	public void setStatus_pegawai_model(StatusPegawaiModel status_pegawai_model) {
		this.status_pegawai_model = status_pegawai_model;
	}
	public TimKerjaModel.Collection getTim_kerja_model() {
		return tim_kerja_model;
	}
	public void setTim_kerja_model(TimKerjaModel.Collection tim_kerja_model) {
		this.tim_kerja_model = tim_kerja_model;
	}
	public JSONObject getJSONObject(){
		JSONObject returnValue = new JSONObject();
        returnValue.put("id",id);
        returnValue.put("nama",nama);
        returnValue.put("nip",nip);
        returnValue.put("nip_lama",nip_lama);
        returnValue.put("tempat_lahir",tempat_lahir);
        returnValue.put("tgl_lahir",tgl_lahir);
        returnValue.put("status_pegawai_model",status_pegawai_model.getJSONObject());
        returnValue.put("user_model",user_model.getJSONObject());
        returnValue.put("tim_kerja_model",tim_kerja_model.getJSONArray());
		return returnValue; 
	}	
	public static class Collection{
		private ArrayList<PegawaiModel> collection = new ArrayList<PegawaiModel>();
		public ArrayList<PegawaiModel> getCollection() {
			return Collection.this.collection;
		}
        public JSONArray getJSONArray(){
            JSONArray returnValue = new JSONArray();
            for(int i = 0;i < Collection.this.getCollection().size();i++){
                returnValue.put(Collection.this.getCollection().get(i).getJSONObject());
            }
            return returnValue;
        }
	}
}