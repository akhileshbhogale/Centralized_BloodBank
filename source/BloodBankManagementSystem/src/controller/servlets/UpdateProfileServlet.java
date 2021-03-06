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
import model.beans.*;


@WebServlet("/updateprofile")
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
   
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		con = (Connection) config.getServletContext().getAttribute("dbcon");
	}

	
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int type_id=(Integer)request.getSession().getAttribute("type_id");
		
		Users curr_user=(Users)request.getSession().getAttribute("curr_user");
		
		
		curr_user.setUser_name(request.getParameter("user_name"));
		curr_user.setUser_contact(request.getParameter("user_contact"));
		
		request.getSession().setAttribute("curr_user", curr_user);
		
		CallableStatement cs=null;
		
		
		
		
		try {
			cs=con.prepareCall("{call sp_UpdateProfile(?,?,?,?)}");
			cs.setInt(1,type_id);
			cs.setString(2,curr_user.getUser_email());
			cs.setString(3,curr_user.getUser_name());
			cs.setString(4,curr_user.getUser_contact());
			System.out.println(curr_user);
			
			
			int n=cs.executeUpdate();
			
			
			response.sendRedirect("UpdateProfile.jsp");
			
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
