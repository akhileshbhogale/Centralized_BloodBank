package controller.servlets;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.beans.Users;


@WebServlet("/registerfordonationcamp")
public class RegisterForDonationCampServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Connection con;

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		con = (Connection) config.getServletContext().getAttribute("dbcon");
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CallableStatement cs=null;
		
		String []camp_id_list=request.getParameterValues("camp_id");
		String email=((Users)request.getSession().getAttribute("curr_user")).getUser_email();
		
		for(int i=0;i<camp_id_list.length;i++)
		{
			
		
			
			
			try {
				
				
				cs=con.prepareCall("{call sp_RegisterForCamp(?,?)}");
				cs.setInt(1, Integer.parseInt(camp_id_list[i]));
				cs.setString(2, email);
				
				
				cs.executeUpdate();
				
				
				
				
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally
			{
				try {
					
					cs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
		}
		
		response.sendRedirect("mystocks");
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
