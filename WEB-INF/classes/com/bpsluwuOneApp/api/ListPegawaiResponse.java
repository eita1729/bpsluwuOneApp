package com.bpsluwuOneApp.api;
import org.json.*;
import com.bpsluwuOneApp.db.*;
public class ListPegawaiResponse {
    /**
        [{
            "id":id,"nama":nama,"nip":nip,"nip_lama":nip_lama,"tempat_lahir":tempat_lahir,"tgl_lahir":tgl_lahir,
            "status_pegawai_model":{
                "id":id,"ket":ket
            },
            "user_model":{
                "id":id,"username":username,"status":status
            },
            "tim_kerja_model":[{"id":id,"nama":nama},{"id":id2,"nama":nama2}]
            }
        },
        {   .....

        }]
     **/
    public static String retrieveGetAllPegawaiResponse(){
        return PegawaiDB.getAllPegawai().getJSONArray().toString();
    }
        /**
        {
            "id":id,"nama":nama,"nip":nip,"nip_lama":nip_lama,"tempat_lahir":tempat_lahir,"tgl_lahir":tgl_lahir,
            "status_pegawai_model":{
                "id":id,"ket":ket
            },
            "user_model":{
                "id":id,"username":username,"status":status
            },
            "tim_kerja_model":[{"id":id,"nama":nama},{"id":id2,"nama":nama2}]
            }
        }
     **/
    public static String retrieveGetPegawaiByIdResponse(int input_id){
        return PegawaiDB.getPegawaiById(input_id).getJSONObject().toString();
    }
        /**
        [{
            "id":id,"nama":nama,"nip":nip,"nip_lama":nip_lama,"tempat_lahir":tempat_lahir,"tgl_lahir":tgl_lahir,
            "status_pegawai_model":{
                "id":id,"ket":ket
            },
            "user_model":{
                "id":id,"username":username,"status":status
            },
            "tim_kerja_model":[{"id":id,"nama":nama},{"id":id2,"nama":nama2}]
            }
        },
        {   .....

        }]
     **/
    public static String retrieveGetPegawaiByTimKerjaIdResponse(int input_id){
        return PegawaiDB.getPegawaiByTimKerja(input_id).getJSONArray().toString();
    }
}
