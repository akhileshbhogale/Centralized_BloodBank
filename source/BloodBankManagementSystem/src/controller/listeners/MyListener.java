package controller.listeners;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import model.beans.BloodBagTypes;
import model.beans.BloodGroups;


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
    		
    		
    		CallableStatement cs=null;
    		ResultSet rs=null;
    		List<String> city_list = new ArrayList<>();
    		List<BloodGroups> bg_list = new ArrayList<>();
    		List<BloodBagTypes> bbt_list = new ArrayList<>();
    		
    		cs=con.prepareCall("{call sp_FetchCities()}");
			rs=cs.executeQuery();
			
			while(rs.next())
			{
				String city = new String(rs.getString(1));
				System.out.println(city);
				city_list.add(city);
			}
						
			sce.getServletContext().setAttribute("city_list",city_list);
			
			cs=con.prepareCall("{call sp_FetchBloodGroupTypes()}");
			rs=cs.executeQuery();
			
			while(rs.next())
			{
				BloodGroups bg = new BloodGroups(rs.getInt(1),rs.getString(2));
				System.out.println(bg);
				bg_list.add(bg);
			}
						
			sce.getServletContext().setAttribute("bg_list",bg_list);
			
			
			cs=con.prepareCall("{call sp_FetchBloodBagTypes()}");
			rs=cs.executeQuery();
			
			while(rs.next())
			{
				BloodBagTypes bbt = new BloodBagTypes(rs.getInt(1),rs.getString(2),rs.getString(3));
				System.out.println(bbt);
				bbt_list.add(bbt);
			}
						
			sce.getServletContext().setAttribute("bbt_list",bbt_list);
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	
    	
    	
    	
    	
    	
    }
	
}
