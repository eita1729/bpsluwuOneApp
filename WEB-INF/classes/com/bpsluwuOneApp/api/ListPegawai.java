package com.bpsluwuOneApp.api;
import javax.ws.rs.Path;
import javax.annotation.Generated;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;
import javax.ws.rs.PathParam;
@Path("/api/list_pegawai")
public class ListPegawai{
	@GET
	@Path("all")	
	public Response getAll(){
		return Response.status(200).entity(ListPegawaiResponse.retrieveGetAllPegawaiResponse()).build();
	}
	@GET
	@Path("id/{id : \\d+}")
	public Response getByPegawaiId(@PathParam("id") int id){
		return Response.status(200).entity(ListPegawaiResponse.retrieveGetPegawaiByIdResponse(id)).build();
	}
	@GET
	@Path("tim_kerja/{id: \\d+}")
	public Response getByTimKerjaId(@PathParam("id") int id){
		return Response.status(200).entity(ListPegawaiResponse.retrieveGetPegawaiByTimKerjaIdResponse(id)).build();
	}

}