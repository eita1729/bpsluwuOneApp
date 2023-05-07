package com.bpsluwuOneApp.dto;
import java.util.ArrayList;
import org.json.*;
public class TimKerjaModel {
    private int id = 0;
    private String nama = null;
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getNama() {
        return this.nama;
    }
    public void setNama(String nama) {
        this.nama = nama;
    }
    public JSONObject getJSONObject(){
		JSONObject returnValue = new JSONObject();
        returnValue.put("id",id);
        returnValue.put("nama",nama);
		return returnValue; 
	}	
    public static class Collection{
		private ArrayList<TimKerjaModel> collection = new ArrayList<TimKerjaModel>();
		public ArrayList<TimKerjaModel> getCollection() {
			return Collection.this.collection;
		}
        public JSONArray getJSONArray(){
            JSONArray returnValue = new JSONArray();
            for(int i = 0;i < Collection.this.getCollection().size();i++){
                //System.out.println(Collection.this.getCollection().get(i).getJSONObject().toString());
                returnValue.put(Collection.this.getCollection().get(i).getJSONObject());
            }
            //System.out.println(returnValue.toString());
            return returnValue;
        }
	} 
}
