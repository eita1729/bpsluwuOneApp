package com.bpsluwuOneApp.api;
import java.util.Set;
import java.util.HashSet;
import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;
@ApplicationPath("/")
public class ApplicationInit extends Application{
	private Set<Object> singletonsMap = new HashSet<Object>();
	private Set<Class<?>> classesMap = new HashSet<Class<?>>();
	public ApplicationInit(){
		singletonsMap.add(new ListPegawai());
	}
	public Set<Object> getSingletons(){
		return this.singletonsMap;
	}
	public Set<Class<?>> getClasses(){
		return classesMap;
	}
}