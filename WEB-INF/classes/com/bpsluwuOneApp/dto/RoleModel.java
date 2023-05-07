package com.bpsluwuOneApp.dto;
import java.util.ArrayList;
import org.json.*;
public class RoleModel {
    //0. Super Admin
    //1. Kepala BPS
    //2. Pegawai BPS
    //3. PPNPN
    private int id = 0;
    private String ket = null;
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getKet() {
        return ket;
    }
    public void setKet(String ket) {
        this.ket = ket;
    }
    public JSONObject getJSONObject(){
		JSONObject returnValue = new JSONObject();
        returnValue.put("id",id);
        returnValue.put("ket",ket);
		return returnValue; 
	}	
    public static class Collection{
		private ArrayList<RoleModel> collection = new ArrayList<RoleModel>();
		public ArrayList<RoleModel> getCollection() {
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
