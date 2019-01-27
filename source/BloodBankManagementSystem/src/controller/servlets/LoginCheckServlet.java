package controller.servlets;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.beans.DonationHistory;


@WebServlet("/logincheck")
public class LoginCheckServlet extends HttpServlet {
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
			cs=con.prepareCall("{call sp_CheckUserDetails(?,?,?)}");
			cs.setString(1,(String)request.getParameter("emailid"));
			cs.setString(2,(String)request.getParameter("pwd"));
			cs.setInt(3,123);
			//cs.setString(1,"akhileshbhogal@gmail.com");
			//cs.setString(2,"akhilesh@123");
			//cs.setInt(3,123);
			
			cs.registerOutParameter(3, Types.INTEGER);
			
			cs.executeUpdate();
			
			int type_id=cs.getInt(3);
			System.out.println(type_id);
			
			request.getSession().setAttribute("type_id", type_id);
			
			request.getRequestDispatcher("/home").forward(request, response);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			try {
				//rs.close();
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
