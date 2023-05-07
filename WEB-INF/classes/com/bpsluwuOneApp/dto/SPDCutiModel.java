package com.bpsluwuOneApp.dto;
import java.util.ArrayList;
import org.json.*;
public class SPDCutiModel {
    private int id = 0;
    private PegawaiModel pegawai_model = null;
    private int tanggal = 0;
    private int bulan = 0;
    private int tahun = 0;
    private SPDCutiStatusModel spd_cuti_status_model = null;
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public PegawaiModel getPegawai_model() {
        return pegawai_model;
    }
    public void setPegawai_model(PegawaiModel pegawai_model) {
        this.pegawai_model = pegawai_model;
    }
    public int getTanggal() {
        return tanggal;
    }
    public void setTanggal(int tanggal) {
        this.tanggal = tanggal;
    }
    public int getBulan() {
        return bulan;
    }
    public void setBulan(int bulan) {
        this.bulan = bulan;
    }
    public int getTahun() {
        return tahun;
    }
    public void setTahun(int tahun) {
        this.tahun = tahun;
    }
    public SPDCutiStatusModel getSpd_cuti_status_model() {
        return spd_cuti_status_model;
    }
    public void setSpd_cuti_status_model(SPDCutiStatusModel spd_cuti_status_model) {
        this.spd_cuti_status_model = spd_cuti_status_model;
    }
    public JSONObject getJSONObject(){
		JSONObject returnValue = new JSONObject();
        returnValue.put("id",id);
        returnValue.put("pegawai_id",pegawai_model.getId());
        returnValue.put("tanggal",tanggal);
        returnValue.put("bulan",bulan);
        returnValue.put("tahun",tahun);
        returnValue.put("spd_cuti_status_id",spd_cuti_status_model.getId());
		return returnValue; 
	}	
    public static class Collection{
		private ArrayList<SPDCutiStatusModel> collection = new ArrayList<SPDCutiStatusModel>();
		public ArrayList<SPDCutiStatusModel> getCollection() {
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
