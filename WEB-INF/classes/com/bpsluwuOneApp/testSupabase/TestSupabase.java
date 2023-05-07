package com.bpsluwuOneApp.testSupabase;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class TestSupabase{
	public static void main(String[] args){
		boolean status_driver = false;
		while(status_driver == false){
			try{
				Class.forName("org.postgresql.Driver");
				status_driver = true;
			} catch(Exception ee){
				System.out.println(ee.getMessage());
			}
		}
		Connection koneksi_db = null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		ResultSet rs = null;
		try{
			koneksi_db = DriverManager.getConnection("jdbc:postgresql://db.xkreizuzyyehgzxywfka.supabase.co:5432/postgres?user=postgres&password=SupabaseDatabase7");
/**			ps = koneksi_db.prepareStatement("select * from User;");
			rs = ps.executeQuery();
			while(rs.next()){
				String nama = rs.getString("nama");
				String nip = rs.getString("nip");
				System.out.println("Nama : "+nama);
				System.out.println("NIP : "+nip);
				System.out.println("=============");
			}
			ps2 = koneksi_db.prepareStatement("insert into cobacoba(nama,nip) values(?,?);");
			ps2.setString(1,"Zifah");
			ps2.setString(2,"3406012");
			int hmm = ps2.executeUpdate();
**/
			ps = koneksi_db.prepareStatement("select * from tim_kerja right join pegawai_tim_bridge on tim_kerja.id = pegawai_tim_bridge.tim_kerja_id where pegawai_tim_bridge.pegawai_id = ?;");
			ps.setInt(1,1);
			rs = ps.executeQuery();
			while(rs.next()){
				int id = rs.getInt("tim_kerja_id");
				String nama = rs.getString("nama");
				System.out.println(id+" : "+nama);
			}
		} catch(Exception ee){
			System.out.println(ee.getMessage());
			try{
				rs.close();
				ps.close();
				//ps2.close();
				koneksi_db.close();
			} catch(Exception er){

			}
		}
	}
}