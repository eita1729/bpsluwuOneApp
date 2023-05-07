package com.bpsluwuOneApp.dto;
import java.util.ArrayList;
import org.json.*;
public class UserModel{
	private int id = 0;
	private String username = null;
	private String password = null;
	//status : "Pegawai" or "PPNPN"
	private String status = null;
	private RoleModel role_model = null;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public RoleModel getRole_model() {
		return role_model;
	}
	public void setRole_model(RoleModel role_model) {
		this.role_model = role_model;
	}
	public JSONObject getJSONObject(){
		JSONObject returnValue = new JSONObject();
        returnValue.put("id",id);
        returnValue.put("username",username);
        returnValue.put("status",status);
		returnValue.put("role_model",role_model.getJSONObject());
		return returnValue; 
	}
	public static class Collection{
		private ArrayList<UserModel> collection = new ArrayList<UserModel>();
		public ArrayList<UserModel> getCollection() {
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