package controller.servlets;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
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
import model.beans.OrderHistory;


@WebServlet("/donationhistory")
public class DonationHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
		Connection con;
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		con = (Connection) config.getServletContext().getAttribute("dbcon");
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CallableStatement cs=null;
		ResultSet rs=null;
		List<DonationHistory> donation_history_list = new ArrayList<>();
		try {
			cs=con.prepareCall("{call sp_FetchDonationHistory(?)}");
			//cs.setString(1,(String)request.getSession().getAttribute("u_email"));
			/*cs.setString(2,(String)request.getSession().getAttribute("u_email"));*/
			cs.setString(1,"akhileshbhogale@gmail.com");
			
			rs=cs.executeQuery();
			
			while(rs.next())
			{
				Date d=rs.getDate(2);
				DateFormat df=new SimpleDateFormat("dd-MM-YYYY");
				String date=df.format(d);
				DonationHistory dhistory = new DonationHistory(rs.getString(1),date,rs.getString(3));
				System.out.println(dhistory);
				donation_history_list.add(dhistory);
			}
			request.getSession().setAttribute("donation_history_list",donation_history_list);
			System.out.println(donation_history_list);
			request.getRequestDispatcher("/DonationHistory.jsp").forward(request, response);
			
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
