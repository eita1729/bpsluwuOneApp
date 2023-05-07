package com.bpsluwuOneApp.listener;
import javax.servlet.http.*;
import javax.servlet.*;
import com.bpsluwuOneApp.db.ConnectionDB;
public class AppContextListener implements ServletContextListener {
    public void contextInitialized(ServletContextEvent sce){
        ConnectionDB.startDataSource();
	}
	public void contextDestroyed(ServletContextEvent sce){
        ConnectionDB.getDataSource().close();
	}
}


