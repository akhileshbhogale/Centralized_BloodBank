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
		CallableStatement cs=null;
		ResultSet rs=null;
		List<UpdateProfile> profile_list = new ArrayList<>();
		
		
		try {
			cs=con.prepareCall("{call sp_FetchProfileDetails(?,?)}");
			/*cs.setInt(1,(Integer)request.getSession().getAttribute("type_id"));
			cs.setString(2,(String)request.getSession().getAttribute("u_email"));*/
			cs.setInt(1,1);
			cs.setString(2,"tanjulr@gmail.com");
			rs=cs.executeQuery();
			
			while(rs.next())
			{
				UpdateProfile profile = new UpdateProfile(rs.getString(1),rs.getString(2),rs.getString(3));
				System.out.println(profile);
				profile_list.add(profile);
			}
						
			request.getSession().setAttribute("profile_list",profile_list);
			System.out.println(profile_list);
			request.getRequestDispatcher("/UpdateProfile.jsp").forward(request, response);
			
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
