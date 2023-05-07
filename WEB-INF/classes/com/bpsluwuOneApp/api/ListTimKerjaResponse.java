package com.bpsluwuOneApp.api;
import org.json.*;
import com.bpsluwuOneApp.db.*;
public class ListTimKerjaResponse {
    /**
        [{
            "id":id,"nama":nama
        },
            {"id":id2,"nama":nama2
        },
        {  
             .....
        }]
     **/
    public static String retrieveGetAllTimKerjaResponse(){
        return TimKerjaDB.getAllTimKerja().getJSONArray().toString();
    }
        /**
        [{
            "id":id,"nama":nama
        },
            {"id":id2,"nama":nama2
        },
        {  
             .....
        }]
     **/
    public static String retrieveGetTimKerjaByPegawaiIdResponse(int input_id){
        return TimKerjaDB.getTimKerjaByPegawai(input_id).getJSONArray().toString();
    }
}
