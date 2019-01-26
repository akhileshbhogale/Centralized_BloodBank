package controller.listeners;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;


@WebListener
public class MyListener implements ServletContextListener {

    
Connection con;
	
    public void contextDestroyed(ServletContextEvent sce)  { 
         try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

	
    public void contextInitialized(ServletContextEvent sce)  { 
         
    	String driverclass = sce.getServletContext().getInitParameter("classname");
    	String jdbcurl = sce.getServletContext().getInitParameter("jdbcurl");
    	
    	try
    	{
    		Class.forName(driverclass);
    		con= DriverManager.getConnection(jdbcurl,"root","");
    		sce.getServletContext().setAttribute("dbcon", con);
    		System.out.println("con is set as context level attribute in quiz app");
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	
    	
    	
    	
    	
    	
    }
	
}
