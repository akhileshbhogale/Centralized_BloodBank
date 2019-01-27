package controller.servlets;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.beans.BloodBagTypes;
import model.beans.BloodGroups;


@WebServlet("/home")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Connection con;
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		con = (Connection) config.getServletContext().getAttribute("dbcon");
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		//PreparedStatement ps=null;
		CallableStatement cs=null;
		ResultSet rs=null;
		List<String> city_list = new ArrayList<>();
		List<BloodGroups> bg_list = new ArrayList<>();
		List<BloodBagTypes> bbt_list = new ArrayList<>();
		
		try {
			//ps=con.prepareStatement("select distinct city from addresses where type_id=? or type_id=?");
			//ps.setInt(1, 2);
			//ps.setInt(2, 3);
			
			cs=con.prepareCall("{call sp_FetchCities()}");
			rs=cs.executeQuery();
			
			while(rs.next())
			{
				String city = new String(rs.getString(1));
				System.out.println(city);
				city_list.add(city);
			}
						
			getServletContext().setAttribute("city_list",city_list);
			
			
			
			
			
			
			//request.getSession().setAttribute("c_list", c_list);
			request.getRequestDispatcher("/ViewStocks.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			try {
				rs.close();
				cs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}*/
		
		request.getRequestDispatcher("/ViewStocks.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
