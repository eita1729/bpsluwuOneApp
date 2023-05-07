package com.bpsluwuOneApp.api;
import javax.ws.rs.Path;
import javax.annotation.Generated;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;
import javax.ws.rs.PathParam;
@Path("/api/list_tim_kerja")
public class ListTimKerja {
    @GET
	@Path("all")	
	public Response getAll(){
		return Response.status(200).entity(ListTimKerjaResponse.retrieveGetAllTimKerjaResponse()).build();
	}
    @GET
    @Path("pegawai/id/{id : \\d+}")
    public Response getByPegawaiId(@PathParam("id") int id){
        return Response.status(200).entity(ListTimKerjaResponse.retrieveGetTimKerjaByPegawaiIdResponse(id)).build();
    }
}
