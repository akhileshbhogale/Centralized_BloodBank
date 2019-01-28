package controller.servlets;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteAdmin")
public class DeleteAdminServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
	
    Connection con;
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		con = (Connection) config.getServletContext().getAttribute("dbcon");
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CallableStatement cs=null;
		//ResultSet rs=null;

	try {
		//LoginDetails admin = new LoginDetails(4,request.getParameter("admin_email"),request.getParameter("admin_password"));
		//System.out.println(admin);
		try {
			cs=con.prepareCall("{call sp_DeleteAdmin(?)}");
			cs.setString(1, request.getParameter("admin_email"));
			int n = cs.executeUpdate();
			System.out.println("Admin Deleted");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		request.getRequestDispatcher("/AdminDeleted.jsp").forward(request, response);
	}
	finally{
		try {
			cs.close();
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
