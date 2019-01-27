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


@WebServlet("/organizeDonationCamp")
public class OrganizeDonationCampServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Connection con;
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
		con = (Connection) config.getServletContext().getAttribute("dbcon");
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CallableStatement cs=null;
		//ResultSet rs=null;
		//List<UpcomingDonationCamps> camp_list = new ArrayList<>();
		
		
		try {
			//LoginDetails admin = new LoginDetails(4,request.getParameter("admin_email"),request.getParameter("admin_password"));
			//System.out.println(admin);
			try {
				cs=con.prepareCall("{call sp_OrganizeCamp(?,?,?,?)}");
				cs.setString(1, (String)request.getSession().getAttribute("user_email"));
				cs.setString(2, request.getParameter("camp_venue"));
				cs.setString(3, request.getParameter("camp_date"));
				cs.setString(4, request.getParameter("camp_time"));
				int n = cs.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
			request.getRequestDispatcher("/CampAdded.jsp").forward(request, response);
		}
		finally{
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
