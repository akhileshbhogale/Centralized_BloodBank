package controller.servlets;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
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

import model.beans.UpcomingDonationCamps;
import model.beans.Users;




@WebServlet("/upcomingdonationcamps")
public class UpcomingCamps extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Connection con;
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		con = (Connection) config.getServletContext().getAttribute("dbcon");
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CallableStatement cs=null;
		ResultSet rs=null;
		List<UpcomingDonationCamps> camp_list = new ArrayList<>();
		String email=((Users)request.getSession().getAttribute("curr_user")).getUser_email();
		
		try {
			cs=con.prepareCall("{call sp_FetchUpcomingCamps(?)}");
			
			cs.setString(1, email);
			rs=cs.executeQuery();
			
			while(rs.next())
			{
				UpcomingDonationCamps camp = new UpcomingDonationCamps(rs.getString(1),rs.getString(2),rs.getDate(3),rs.getInt(4));
				System.out.println(camp);
				camp_list.add(camp);
			}
						
			request.getSession().setAttribute("camp_list",camp_list);
			System.out.println(camp_list);
			request.getRequestDispatcher("/ShowDonationCamps.jsp").forward(request, response);
			
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
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
