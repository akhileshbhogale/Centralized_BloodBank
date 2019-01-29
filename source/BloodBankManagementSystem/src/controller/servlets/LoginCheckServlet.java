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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.beans.DonationHistory;
import model.beans.Users;


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
		
		CallableStatement cs2=null;
		ResultSet rs2=null;
		
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
			
			if(type_id==-1)
			{
				Cookie c= new Cookie("error_cookie", "Login_Failed");
				response.addCookie(c);
			}
			else
			{
				
				
				
				if(type_id!=4)
				{
					try {
						cs2=con.prepareCall("{call sp_FetchUserDetails(?,?)}");
						cs2.setString(1,(String)request.getParameter("emailid"));
						cs2.setInt(2,type_id);
						
						rs2=cs2.executeQuery();
						
						while(rs2.next())
						{
							Users current_user = new Users(rs2.getString(1),rs2.getString(2),rs2.getString(3));
							request.getSession().setAttribute("curr_user", current_user);
						}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally
					{
						rs2.close();
						cs2.close();
					}
					
				}
				else
				{
					request.getSession().setAttribute("admin_email", (String)request.getParameter("emailid"));
				}
				
				Cookie c= new Cookie("error_cookie", "");
				c.setMaxAge(0);
				response.addCookie(c);
			}
			
			
			if(type_id==4)
			{
				response.sendRedirect("AddAdmin.jsp");
			}
			else
			{
				response.sendRedirect("home");
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
