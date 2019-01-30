package controller.servlets;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/checkemailexists")
public class CheckEmailExistsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Connection con;
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		con = (Connection) config.getServletContext().getAttribute("dbcon");

	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Checking Email.......");
		
		CallableStatement cs=null;
		
		
		try {
			
			
			cs=con.prepareCall("{call sp_CheckEmailExists(?,?)}");
			cs.setString(1,(String)request.getParameter("email_id"));
					
			cs.registerOutParameter(2, Types.BOOLEAN);
			
			cs.executeUpdate();
			
			boolean exists=cs.getBoolean(2);
			System.out.println(exists);
			response.setContentType("text/plain");
			if(exists==true)
			{
				
				response.getWriter().write("EXISTS");
			}
			else
			{
				response.getWriter().write("");
			}
							
			
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
