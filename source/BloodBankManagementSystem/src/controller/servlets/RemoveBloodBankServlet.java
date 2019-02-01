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


@WebServlet("/removebloodbank")
public class RemoveBloodBankServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	Connection con;
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		con = (Connection) config.getServletContext().getAttribute("dbcon");
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CallableStatement cs1=null;
		CallableStatement cs2=null;
		

	try {
		
		
			cs1=con.prepareCall("{call sp_DeleteFromLoginDetails(?)}");
			cs1.setString(1, request.getParameter("bb_email"));
			int n = cs1.executeUpdate();
			
			
			cs2=con.prepareCall("{call sp_DeleteBloodBank(?)}");
			cs2.setString(1, request.getParameter("bb_email"));
			n = cs2.executeUpdate();
			
			System.out.println("Blood Bank Deleted");
		
		
		
		
			request.getRequestDispatcher("/AdminDeleted.jsp").forward(request, response);
	}
	catch (SQLException e) {
		// TODO: handle exception
	}
	finally{
		try {
			cs1.close();
			} 
		catch (SQLException e) {
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
