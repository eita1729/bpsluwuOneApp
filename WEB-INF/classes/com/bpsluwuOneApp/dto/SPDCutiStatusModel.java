package com.bpsluwuOneApp.dto;
import java.util.ArrayList;
import org.json.*;
public class SPDCutiStatusModel {
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
