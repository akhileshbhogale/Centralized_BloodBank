package controller.servlets;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.beans.StockDetails;
import model.beans.Users;


@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Connection con;
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		con = (Connection) config.getServletContext().getAttribute("dbcon");
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		CallableStatement cs1=null;
		CallableStatement cs2=null;
		CallableStatement cs3=null;
		
		
		
		try {
			
			
			
			cs1=con.prepareCall("{call sp_AddLoginDetails(?,?,?)}");
			cs1.setInt(1, Integer.parseInt(request.getParameter("user_type")));
			cs1.setString(2, request.getParameter("email_id"));
			cs1.setString(3, request.getParameter("pwd"));
			int n1=cs1.executeUpdate();
			
			
			cs2=con.prepareCall("{call sp_AddUser(?,?,?,?)}");
			cs2.setInt(1, Integer.parseInt(request.getParameter("user_type")));
			cs2.setString(2, request.getParameter("nm"));
			cs2.setString(3, request.getParameter("email_id"));
			cs2.setString(4, request.getParameter("contact"));
			int n2=cs2.executeUpdate();
			
			
			cs3=con.prepareCall("{call sp_AddAddress(?,?,?,?)}");
			cs3.setInt(1, Integer.parseInt(request.getParameter("user_type")));
			cs3.setString(2, request.getParameter("email_id"));
			cs3.setString(3, request.getParameter("address"));
			cs3.setString(4, request.getParameter("city"));
			int n3=cs3.executeUpdate();
			
			
			response.sendRedirect("RegisteredSuccessfullyMessage.jsp");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			try {
				
				cs1.close();
				cs2.close();
				cs3.close();
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
